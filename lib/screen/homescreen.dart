import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zest/screen/transition/ripplepagetransition.dart';
import 'package:zest/utils/palette.dart';
import 'bottomappbar.dart';
import 'searchscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final GlobalKey _fabButtonKey = GlobalKey();
  RipplePageTransition _ripplePageTransition;

  static const _FabButtonColor = Palette.kToLight;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) =>
    {
      FlutterNativeSplash.remove()
    });
    _ripplePageTransition = RipplePageTransition(_fabButtonKey);
  }

  @override
  Widget build(BuildContext context) =>
      Stack(children: [
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
              ],
            ),
          ),
          floatingActionButton: _floatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
          bottomNavigationBar: const MyBottomAppBar (),
        ),
        _ripplePageTransition
      ]);

  Widget get _floatingActionButton =>
      FloatingActionButton(
        key: _fabButtonKey,
        backgroundColor: _FabButtonColor,
        elevation: 2.0,
        onPressed: () => _ripplePageTransition.navigateTo(const SearchScreen()),
        child: const Icon(Icons.search, size: 40),
      );
}


