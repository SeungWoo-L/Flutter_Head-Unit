import 'package:flutter/cupertino.dart';
import 'package:flutter_head_unit/icons/apple-map.dart';
import 'package:flutter_head_unit/icons/apple-music.dart';
import 'package:flutter_head_unit/icons/apple-settings.dart';

//For now it's going to be stateless,
//But later if I have time I will make it modifiable
class Favorites extends StatelessWidget {
  const Favorites();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * 0.1,
      ),
      // constraints:
      //     BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.6),
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          AppleMap(size: MediaQuery.sizeOf(context).width * 0.06),
          AppleMusic(size: MediaQuery.sizeOf(context).width * 0.06),
          AppleSettings(size: MediaQuery.sizeOf(context).width * 0.06)
        ],
      ),
    );
  }
}
