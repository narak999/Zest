import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zest/screen/homescreen.dart';
import 'package:zest/screen/signinscreen.dart';
import 'package:zest/utils/palette.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const Zest());
}

class Zest extends StatelessWidget {
  const Zest({Key key}) : super(key: key);

  static const String _title = 'Zest';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Palette.kToLight[20],
        primarySwatch: Palette.kToLight,
      ),
      home: const Checking(),
    );
  }
}


class Checking extends StatelessWidget {
  const Checking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return const SignInScreen();
          } else {
            return const MyHomeScreen(title: "Zest");
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}