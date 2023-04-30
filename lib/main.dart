import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zest/screen/signinscreen.dart';
import 'package:zest/utils/palette.dart';

Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
      home: const SignInScreen(),
    );
  }
}