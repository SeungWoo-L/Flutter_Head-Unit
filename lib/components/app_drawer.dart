import 'package:flutter/cupertino.dart';
import 'package:flutter_head_unit/icons/apple-contact.dart';
import 'package:flutter_head_unit/icons/apple-map.dart';
import 'package:flutter_head_unit/icons/apple-music.dart';
import 'package:flutter_head_unit/icons/apple-phone.dart';
import 'package:flutter_head_unit/icons/apple-photos.dart';
import 'package:flutter_head_unit/icons/apple-safari.dart';
import 'package:flutter_head_unit/icons/apple-settings.dart';
import 'package:flutter_head_unit/icons/apple-weather.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer();
  final iconScale = 0.17;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.03),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.8),
      child: Wrap(
        spacing: MediaQuery.sizeOf(context).width * 0.03,
        runSpacing: MediaQuery.sizeOf(context).height * 0.2,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          ApplePhone(size: MediaQuery.sizeOf(context).shortestSide * iconScale),
          AppleContact(
              size: MediaQuery.sizeOf(context).shortestSide * iconScale),
          AppleMusic(size: MediaQuery.sizeOf(context).shortestSide * iconScale),
          AppleMap(size: MediaQuery.sizeOf(context).shortestSide * iconScale),
          AppleSafari(
              size: MediaQuery.sizeOf(context).shortestSide * iconScale),
          ApplePhotos(
              size: MediaQuery.sizeOf(context).shortestSide * iconScale),
          AppleSettings(
              size: MediaQuery.sizeOf(context).shortestSide * iconScale),
          AppleWeather(
              size: MediaQuery.sizeOf(context).shortestSide * iconScale)
        ],
      ),
    );
  }
}
