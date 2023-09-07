import 'package:flutter/cupertino.dart';

class AppleSafari extends StatelessWidget {
  final double size;

  const AppleSafari({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Safari");
        },
        child: Image.asset(
          'images/icon/safari.png',
          width: size,
        ));
  }
}
