import 'package:flutter/material.dart';
import 'package:zest/utils/palette.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showClearButton = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: const EdgeInsets.only(right: 8, top: 3),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Palette.kToLight,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 27,
                  left: 28,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      autofocus: true,
                      controller: _controller,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          hintText: 'Search',
                          border: const OutlineInputBorder(),
                          suffixIcon: _showClearButton ?
                            IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                _controller.clear();
                              },
                            )
                        : null,
                      ),
                    ),
                  )
                )
            ],
            )
          ),
          elevation: 2.0,
        )
    );
  }
}
