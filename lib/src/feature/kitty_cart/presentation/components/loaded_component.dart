part of '../kitty_cart_screen.dart';

class _LoadedComponent extends StatefulWidget {
  const _LoadedComponent({required this.fact, required this.imageUrl});

  final String fact;
  final String imageUrl;

  @override
  State<_LoadedComponent> createState() => _LoadedComponentState();
}

class _LoadedComponentState extends State<_LoadedComponent> {
  late final DefaultCacheManager baseCacheManager;
  bool isError = false;

  @override
  void initState() {
    baseCacheManager = DefaultCacheManager();
    super.initState();
  }

  void _saveImage(BuildContext context) async {
    if (isError) return;
    // Запрос разрешения на доступ к медиафайлам (Android 13+)
    if (Platform.isAndroid) {
      var status = await Permission.photos.request();
      if (!status.isGranted) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Нет разрешения на сохранение")),
          );
        }
        return;
      }
    }
    // Получаем файл из кэша
    File? file = await baseCacheManager.getSingleFile(widget.imageUrl);
    // Создаём новый файл с новым именем
    File newFile = File(
      "${file.parent.path}/cat_${DateTime.now().millisecondsSinceEpoch}.jpg",
    )..writeAsBytesSync(file.readAsBytesSync());
    // Сохраняем в галерею
    final success = await GallerySaver.saveImage(newFile.path);
    newFile.delete();
    if (context.mounted) {
      String message =
          success ?? false ? "Изображение сохранено!" : "Ошибка при сохранении";

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return UiShrinkButton(
      onPressed: () => _saveImage(context),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: context.theme.appColor.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return _buildOrientation(
              orientation: orientation,
              children: [
                CachedNetworkImage(
                  cacheManager: baseCacheManager,
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, _) => _buildLoadingImage(),
                  errorWidget:
                      (context, url, error) => _buildErrorImage(context),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: UiText.bodyLarge(
                      widget.fact,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOrientation({
    required Orientation orientation,
    required List<Widget> children,
  }) {
    return orientation == Orientation.portrait
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: children,
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 16,
          children: children,
        );
  }

  Widget _buildLoadingImage() =>
      SizedBox.square(dimension: 200, child: _LoadingComponent());

  Widget _buildErrorImage(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          SizedBox(height: 16),
          Image.asset(
            Assets.images.error.path,
            fit: BoxFit.fitWidth,
            width: 100,
          ),
          UiText.bodyMedium(
            'Ошибка загрузки картинки',
            color: context.theme.appColor.textSecondary,
          ),
          Divider(color: context.theme.appColor.secondary),
        ],
      ),
    );
  }

  @override
  void dispose() {
    baseCacheManager.dispose();
    super.dispose();
  }
}
