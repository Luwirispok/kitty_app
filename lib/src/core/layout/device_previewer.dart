import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

class DevicePreviewer extends StatelessWidget {
  const DevicePreviewer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: kDebugMode,
      backgroundColor: Colors.black12,
      defaultDevice: Devices.ios.iPhone13,
      builder: (context) => child,
    );
  }
}
