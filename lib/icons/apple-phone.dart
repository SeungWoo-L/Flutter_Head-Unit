import 'package:flutter/cupertino.dart';

class ApplePhone extends StatelessWidget {
  final double size;

  const ApplePhone({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Phone");
        },
        child: Image.asset(
          'images/icon/phone.png',
          width: size,
        ));
  }
}
