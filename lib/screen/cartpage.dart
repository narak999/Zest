import 'package:flutter/material.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {

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
              'Cart Page',
            ),
          ],
        ),
      ),
    );
  }
}