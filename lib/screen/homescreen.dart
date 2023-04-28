import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:zest/screen/profilepage.dart';
import 'package:zest/screen/transition/ripplepagetransition.dart';
import 'package:zest/utils/palette.dart';
import 'bottomappbar.dart';
import 'cartpage.dart';
import 'homepage.dart';
import 'menupage.dart';
import 'searchscreen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key key, this.title = 'Zest'}) : super(key: key);
  final String title;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> with TickerProviderStateMixin {
  final GlobalKey _fabButtonKey = GlobalKey();
  RipplePageTransition _ripplePageTransition;
  static const _fabButtonColor = Palette.kToLight;
  final PageController pageController = PageController(initialPage: 0);

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
            centerTitle: true,
          ),
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              Center(
                child: MyHomePage(),
              ),
              Center(
                child: MyProfilePage(),
              ),
              Center(
                child: MyCartPage(),
              ),
              Center(
                child: MyMenuPage(),
              ),
            ],
          ),
          floatingActionButton: _floatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
          bottomNavigationBar: MyBottomAppBar(
            pageController: pageController,
            color: Colors.grey,
            selectedColor: Palette.kToLight,
            notchedShape: const CircularNotchedRectangle(),
            items: [
              MyBottomAppBarItem(iconData: Icons.home, text: 'Home', tooltip: const Tooltip(message: "Home")),
              MyBottomAppBarItem(iconData: Icons.person, text: 'Profile', tooltip: const Tooltip(message: "Profile")),
              MyBottomAppBarItem(iconData: Icons.shopping_cart, text: 'Cart', tooltip: const Tooltip(message: "Cart")),
              MyBottomAppBarItem(iconData: Icons.menu, text: 'Menu', tooltip: const Tooltip(message: "Menu")),
            ],
          ),
        ),
        _ripplePageTransition
      ])
  ;

  Widget get _floatingActionButton =>
      FloatingActionButton(
        key: _fabButtonKey,
        backgroundColor: _fabButtonColor,
        elevation: 2.0,
        onPressed: () => {
          HapticFeedback.lightImpact(),
          _ripplePageTransition.navigateTo(const SearchScreen())
        },
        child: const Icon(Icons.search, size: 40),
      );
}


