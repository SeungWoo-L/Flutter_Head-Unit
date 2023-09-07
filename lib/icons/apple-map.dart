import 'package:flutter/cupertino.dart';

class AppleMap extends StatelessWidget {
  final double size;

  const AppleMap({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Map");
        },
        child: Image.asset(
          'images/icon/maps.png',
          width: size,
        ));
  }
}
