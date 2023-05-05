import 'package:flutter/material.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({Key key}) : super(key: key);

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Zest'),
            const Spacer(flex: 1),
            Image.asset(
              'assets/logo/png/lemon-29-64.png',
              fit: BoxFit.cover,
              height: 50,
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
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
}