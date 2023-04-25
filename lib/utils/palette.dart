import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xfffae01e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe6cb26),//10%
      100: Color(0xffccb522),//20%
      200: Color(0xffb39e1d),//30%
      300: Color(0xff998819),//40%
      400: Color(0xff807115),//50%
      500: Color(0xff665a11),//60%
      600: Color(0xff4c440d),//70%
      700: Color(0xff332d08),//80%
      800: Color(0xff191704),//90%
      900: Color(0xff000000),//100%
    },
  );

  static const MaterialColor kToLight = MaterialColor(
    0xfffae01e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffe53f),//10%
      100: Color(0xffffe855),//20%
      200: Color(0xffffeb6a),//30%
      300: Color(0xffffee7f),//40%
      400: Color(0xfffff195),//50%
      500: Color(0xfffff3aa),//60%
      600: Color(0xfffff6bf),//70%
      700: Color(0xfffff9d4),//80%
      800: Color(0xfffffcea),//90%
      900: Color(0xffffffff),//100%
    },
  );
}