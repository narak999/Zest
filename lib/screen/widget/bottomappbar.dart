import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyBottomAppBarItem {
  MyBottomAppBarItem({this.iconData, this.text, this.tooltip});
  IconData iconData;
  String text;
  Tooltip tooltip;
}

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({Key key,
    this.pageController,
    this.items,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.height = 55.0,
    this.iconSize = 24.0,
}) : super(key: key);
  final PageController pageController;
  final List<MyBottomAppBarItem> items;
  final double height;
  final double iconSize;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;

  @override
  State<MyBottomAppBar> createState() => MyBottomAppBarState();
}

class MyBottomAppBarState extends State<MyBottomAppBar> with TickerProviderStateMixin{
  int _selectedIndex = 0;

  _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> addSpacer(List<Widget> itemList) {
    List<Widget> widgetList = [
      itemList[0],
      const SizedBox(width: 15),
      itemList[1],
      const SizedBox(width: 60),
      itemList[2],
      const SizedBox(width: 15),
      itemList[3]
    ];
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      shape: widget.notchedShape,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: addSpacer(items),
      ),
    );

  }

  Widget _buildTabItem({
    MyBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              HapticFeedback.heavyImpact();
              onPressed(index);
              widget.pageController.animateToPage(_selectedIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInExpo);
              },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}