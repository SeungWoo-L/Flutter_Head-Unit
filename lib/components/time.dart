import 'package:flutter/cupertino.dart';
import 'dart:async';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late final Timer timer;
  late String currentTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTime();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    var now = DateTime.now();
    var hour = now.hour.toString();
    var minute =
        now.minute < 10 ? '0${now.minute.toString()}' : now.minute.toString();
    currentTime = '$hour:$minute';
    setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        currentTime,
        style: TextStyle(fontSize: MediaQuery.sizeOf(context).width * 0.025),
        textAlign: TextAlign.center,
      ),
    );
  }
}
