import 'package:flutter/material.dart';
import '../utils/palette.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Palette.kToLight,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            const Spacer(flex: 1),
            IconButton(
              tooltip: 'Go to homescreen',
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            const Spacer(flex: 1),
            IconButton(
              tooltip: 'Go to profile screen',
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
            const Spacer(flex: 5),
            IconButton(
              tooltip: 'Go to cart',
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            const Spacer(flex: 1),
            IconButton(
              tooltip: 'Go to more menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}