import 'package:flutter/cupertino.dart';

class AppleMusic extends StatelessWidget {
  final double size;

  const AppleMusic({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Apple music");
        },
        child: Image.asset(
          'images/icon/apple-music.png',
          width: size,
        ));
  }
}
