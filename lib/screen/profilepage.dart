import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zest/screen/signinscreen.dart';
import 'package:zest/services/AuthProvider.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Text('Zest'),
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
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  AuthProvider().signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: const Text('Sign Out')
            )
          ],
        ),
      ),
    );
  }
}