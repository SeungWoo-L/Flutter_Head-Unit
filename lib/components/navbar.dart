import 'package:flutter/cupertino.dart';
import 'package:flutter_head_unit/components/favorites.dart';
import 'package:flutter_head_unit/components/time.dart';
import 'package:flutter_head_unit/icons/homebutton.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(238, 151, 183, 0.9),
          borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(MediaQuery.sizeOf(context).shortestSide * 0.03),
      width: MediaQuery.sizeOf(context).width * 0.1,
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Time(),
            const Favorites(),
            HomeButton(size: MediaQuery.sizeOf(context).width * 0.07)
          ]),
    );
  }
}

// Container(
//               decoration: BoxDecoration(
//                   color:
//                       const Color.fromARGB(255, 112, 145, 172).withOpacity(0.8),
//                   borderRadius: BorderRadius.circular(12)),
//               margin: EdgeInsets.all(10),
//               width: MediaQuery.sizeOf(context).width * 0.1,
//               child: Stack(children: [
//                 Positioned(
//                     width: 100,
//                     top: MediaQuery.sizeOf(context).height * 0.02,
//                     child: Text(
//                       now.hour.toString() + ":" + now.minute.toString(),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: MediaQuery.sizeOf(context).width * 0.03),
//                     )),
//                 Positioned(
//                     width: 100,
//                     top: 50,
//                     child: Column(
//                       children: [
//                         AppleMap(size: 50),
//                         AppleMusic(size: 50),
//                         AppleSettings(size: 50)
//                       ],
//                     )),
//                 Positioned(width: 100, bottom: 0, child: HomeButton(size: 45))
//               ]),