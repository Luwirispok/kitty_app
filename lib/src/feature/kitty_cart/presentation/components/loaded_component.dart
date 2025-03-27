part of '../kitty_cart_screen.dart';

class _LoadedComponent extends StatelessWidget {
  const _LoadedComponent({required this.fact, required this.imageUrl});

  final String fact;
  final String imageUrl;

  final DefaultCacheManager baseCacheManager;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                imageUrl: imageUrl,
                fit: BoxFit.fitWidth,
                placeholder: (context, _) => _buildLoadingImage(),
                errorWidget: (context, url, error) => _buildErrorImage(context),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: UiText.bodyLarge(
                    fact,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          );
        },
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
}
