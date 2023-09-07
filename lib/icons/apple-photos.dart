import 'package:flutter/cupertino.dart';

class ApplePhotos extends StatelessWidget {
  final double size;

  const ApplePhotos({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Photos");
        },
        child: Image.asset(
          'images/icon/photos.png',
          width: size,
        ));
  }
}
