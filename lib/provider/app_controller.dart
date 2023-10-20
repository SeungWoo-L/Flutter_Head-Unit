import 'package:flutter/cupertino.dart';
import 'package:flutter_head_unit/pages/music_player.dart';
import 'package:flutter_head_unit/pages/settings.dart';

class AppController extends ChangeNotifier {
  AppController() {
    debugPrint("Hello world");
  }
  Widget _currentPage = MusicPlayer();

  Widget get currentPage => _currentPage;

  void updatePage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }
}
