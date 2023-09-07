import 'package:flutter/cupertino.dart';
import 'package:flutter_head_unit/icons/apple-contact.dart';
import 'package:flutter_head_unit/icons/apple-map.dart';
import 'package:flutter_head_unit/icons/apple-music.dart';
import 'package:flutter_head_unit/icons/apple-phone.dart';
import 'package:flutter_head_unit/icons/apple-photos.dart';
import 'package:flutter_head_unit/icons/apple-safari.dart';
import 'package:flutter_head_unit/icons/apple-settings.dart';
import 'package:flutter_head_unit/icons/homebutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'iOS style',
      home: const MyHomePage(title: 'Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final now = DateTime.now();
  double size = 70;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/wallpaper/iOS-17-6.webp'))),
        width: 800,
        height: 500,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 112, 145, 172).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.all(10),
              width: 100,
              child: Stack(children: [
                Positioned(
                    width: 100,
                    top: 15,
                    child: Text(
                      now.hour.toString() + ":" + now.minute.toString(),
                      textAlign: TextAlign.center,
                    )),
                Positioned(
                    width: 100,
                    top: 50,
                    child: Column(
                      children: [
                        AppleMap(size: 50),
                        AppleMusic(size: 50),
                        AppleSettings(size: 50)
                      ],
                    )),
                Positioned(width: 100, bottom: 0, child: HomeButton(size: 45))
              ]),
            ),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 650),
              child: Wrap(
                spacing: 40,
                runSpacing: 60,
                runAlignment: WrapAlignment.spaceEvenly,
                children: [
                  ApplePhone(size: size),
                  AppleContact(size: size),
                  AppleMusic(size: size),
                  AppleMap(size: size),
                  AppleSafari(size: size),
                  ApplePhotos(size: size),
                  AppleSettings(size: size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
