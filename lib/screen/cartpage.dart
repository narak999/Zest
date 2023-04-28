import 'package:flutter/material.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {


@override
Widget build(BuildContext context) =>
    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Cart Page',
            ),
          ],
        ),
      ),
    );
}