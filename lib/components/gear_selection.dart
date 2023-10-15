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
  late TextStyle P_State, D_State, N_State, R_State;

  @override
  void initState() {
    // TODO: implement initState
    P_State = Selected;
    D_State = Not_Selected;
    N_State = Not_Selected;
    R_State = Not_Selected;
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
                style: P_State,
              ),
              onPressed: () {
                debugPrint("P");
                P_State = Selected;
                D_State = Not_Selected;
                N_State = Not_Selected;
                R_State = Not_Selected;
                setState(() {});
              }),
          CupertinoButton(
              minSize: 100,
              child: Text(
                "D",
                style: D_State,
              ),
              onPressed: () {
                debugPrint("D");
                P_State = Not_Selected;
                D_State = Selected;
                N_State = Not_Selected;
                R_State = Not_Selected;
                setState(() {});
              }),
          CupertinoButton(
              minSize: 100,
              child: Text(
                "N",
                style: N_State,
              ),
              onPressed: () {
                debugPrint("N");
                P_State = Not_Selected;
                D_State = Not_Selected;
                N_State = Selected;
                R_State = Not_Selected;
                setState(() {});
              }),
          CupertinoButton(
              minSize: 100,
              child: Text(
                "R",
                style: R_State,
              ),
              onPressed: () {
                debugPrint("R");
                P_State = Not_Selected;
                D_State = Not_Selected;
                N_State = Not_Selected;
                R_State = Selected;
                setState(() {});
              }),
        ],
      ),
    );
  }
}
