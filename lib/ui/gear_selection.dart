import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_head_unit/provider/vsomeip.dart';
import 'package:provider/provider.dart';

const TextStyle selectedStyle =
    TextStyle(fontSize: 65, fontWeight: FontWeight.w900, color: Colors.black);
const TextStyle notSelectedStyle = TextStyle(
    fontSize: 55,
    fontWeight: FontWeight.w900,
    color: Color.fromRGBO(0, 0, 0, 0.2));

class GearSelection extends StatefulWidget {
  GearSelection({super.key, required this.selected});

  final String selected;
  final List<String> gearLists = ["P", "D", "N", "R"];

  @override
  State<GearSelection> createState() => _GearSelection();
}

class _GearSelection extends State<GearSelection> {
  @override
  void initState() {
    super.initState();
  }

  void onPressed(String selected_) {
    // TODO : Later add vSomeIP communication here
    Provider.of<VSOMEIP>(context, listen: false).setGear(selected_);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(0xd9, 0xd9, 0xd9, 1)),
        width: MediaQuery.of(context).size.width * 0.16,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ...widget.gearLists.map((item) {
            return CupertinoButton(
                child: Text(
                  item,
                  style: item == widget.selected
                      ? selectedStyle
                      : notSelectedStyle,
                ),
                onPressed: () {
                  onPressed(item);
                });
          })
        ]));
  }
}
