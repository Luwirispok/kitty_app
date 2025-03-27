part of '../kitty_cart_screen.dart';

class _ErrorComponent extends StatelessWidget {
  final String message;

  const _ErrorComponent({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return _buildOrientation(
            orientation: orientation,
            children: [
              Image.asset(Assets.images.error.path, width: 150),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  UiText.bodyLarge(message),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        context.theme.appColor.accent.withValues(alpha: 0.2),
                      ),
                    ),
                    onPressed: () {
                      context.read<KittyCartBloc>().add(KittyCartEvent.load());
                    },
                    child: UiText.bodySmall('Повторить загрузку'),
                  ),
                ],
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
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: children,
        );
  }
}
