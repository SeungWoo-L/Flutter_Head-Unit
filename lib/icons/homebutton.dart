import 'package:flutter/cupertino.dart';

class HomeButton extends StatelessWidget {
  final double size;

  const HomeButton({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Home");
        },
        child: Image.asset(
          'images/icon/home.png',
          width: size,
        ));
  }
}
