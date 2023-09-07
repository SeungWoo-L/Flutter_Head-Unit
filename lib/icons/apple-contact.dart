import 'package:flutter/cupertino.dart';

class AppleContact extends StatelessWidget {
  final double size;

  const AppleContact({required this.size});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          debugPrint("Contact");
        },
        child: Image.asset(
          'images/icon/contacts.png',
          width: size,
        ));
  }
}
