import 'package:flutter/material.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({Key key}) : super(key: key);

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {


@override
Widget build(BuildContext context) =>
    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Menu Page',
            ),
          ],
        ),
      ),
    );
}