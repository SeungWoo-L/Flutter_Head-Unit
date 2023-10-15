import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_head_unit/main.dart';

class GearSelection extends StatefulWidget {
  const GearSelection({super.key});

  @override
  State<GearSelection> createState() => _GearSelection();
}

class _GearSelection extends State<GearSelection> {
  final Selected =
      TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold);
  final Not_Selected = TextStyle(
      color: Color.fromRGBO(200, 200, 200, 0.8),
      fontSize: 30,
      fontWeight: FontWeight.bold);

  late var selected_gear;

  void onPressed(String gear) {
    debugPrint(gear);
    selected_gear = gear;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    selected_gear = "P";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromRGBO(30, 30, 30, 1)),
      width: SCREEN_WIDTH,
      height: SCREEN_HEIGHT * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
              minSize: 100,
              child: Text(
                "P",
                style: selected_gear == "P" ? Selected : Not_Selected,
              ),
              onPressed: () {
                onPressed("P");
              }),
          CupertinoButton(
              minSize: 100,
              child: Text(
                "D",
                style: selected_gear == "D" ? Selected : Not_Selected,
              ),
              onPressed: () {
                onPressed("D");
              }),
          CupertinoButton(
              minSize: 100,
              child: Text(
                "N",
                style: selected_gear == "N" ? Selected : Not_Selected,
              ),
              onPressed: () {
                onPressed("N");
              }),
          CupertinoButton(
              minSize: 100,
              child: Text(
                "R",
                style: selected_gear == "R" ? Selected : Not_Selected,
              ),
              onPressed: () {
                onPressed("R");
              }),
        ],
      ),
    );
  }
}
