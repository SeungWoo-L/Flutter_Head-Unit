import 'package:flutter/cupertino.dart';

class AppleWeather extends StatelessWidget {
  final double size;

  const AppleWeather({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Weather");
        },
        child: Image.asset(
          'images/icon/weather.png',
          width: size,
        ));
  }
}
