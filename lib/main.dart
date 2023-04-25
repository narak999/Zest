import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zest/screen/homescreen.dart';
import 'package:zest/utils/palette.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Zest());
}

class Zest extends StatelessWidget {
  const Zest({Key key}) : super(key: key);

  static const String _title = 'Zest';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Palette.kToLight[20],
        primarySwatch: Palette.kToLight,
      ),
      home: const MyHomePage(title: 'Zest'),
    );
  }
}