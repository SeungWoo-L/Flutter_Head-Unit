import 'package:flutter/cupertino.dart';

class AppleSettings extends StatelessWidget {
  final double size;

  const AppleSettings({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Settings");
        },
        child: Image.asset(
          'images/icon/settings.png',
          width: size,
        ));
  }
}
