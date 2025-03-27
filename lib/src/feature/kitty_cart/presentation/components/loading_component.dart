part of '../kitty_cart_screen.dart';

class _LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Platform.isMacOS || Platform.isIOS
              ? const CupertinoActivityIndicator()
              : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  context.theme.appColor.accent,
                ),
              ),
    );
  }
}