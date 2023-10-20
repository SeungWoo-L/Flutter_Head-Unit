import 'dart:async';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';

typedef initFunc_t = Bool Function();
typedef startFunc_t = Void Function();
typedef getGearFunc_t = Uint8 Function();
typedef setGearFunc_t = Void Function(Uint8 gear);

class VSOMEIP extends ChangeNotifier {
  late final DynamicLibrary _vsomeipLib;
  late final Function _init;
  late final Function _start;
  late final Function _getGear;
  late final Function _setGear;
  Timer? timer;
  String cur_gear = "P";

  bool _initializeFFI() {
    _vsomeipLib = (DynamicLibrary.open('libmyvsomeip.so')); // android and linux
    _init = _vsomeipLib
        .lookup<NativeFunction<initFunc_t>>('init')
        .asFunction<bool Function()>();
    _start = _vsomeipLib
        .lookup<NativeFunction<startFunc_t>>('start')
        .asFunction<void Function()>();
    _getGear = _vsomeipLib
        .lookup<NativeFunction<getGearFunc_t>>('getGear')
        .asFunction<int Function()>();
    _setGear = _vsomeipLib
        .lookup<NativeFunction<setGearFunc_t>>('setGear')
        .asFunction<void Function(int)>();
    return true;
  }

  void update() {
    String gear = String.fromCharCode(_getGear());
    if (cur_gear != gear) {
      cur_gear = gear;
      notifyListeners();
    }
  }

  void setGear(String gear) {
    if (gear == cur_gear) return;
    _setGear(gear.codeUnitAt(0));
    debugPrint("gear chang from $cur_gear to $gear");
    cur_gear = gear;
    notifyListeners();
  }

  VSOMEIP() {
    debugPrint("vsomeip constructor");
    _initializeFFI();
    _init();
    _start();
    timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      update();
    });
  }
}
