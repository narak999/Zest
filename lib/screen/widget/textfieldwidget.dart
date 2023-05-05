import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key key,
    this.icon,
    this.isLoading,
    this.textEditingController,
    this.textInputType,
    this.hintText,
    this.isEmptyText,
    this.invalidText,
    this.isNumericOrAlphabet
  }) : super(key: key);
  final IconData icon;
  final bool isLoading;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final String isEmptyText;
  final String invalidText;
  final bool isNumericOrAlphabet;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState ();
}

class _TextFieldWidgetState  extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          height: 28,
          child: Icon(widget.icon, color: Colors.grey),
        ),
        const SizedBox(width: 18),
        Flexible(
          child: TextFormField(
            enabled: !widget.isLoading,
            controller: widget.textEditingController,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: widget.hintText
            ),
            validator: (value) {
              if (value.isEmpty) {
                return widget.isEmptyText;
              }
              if (!isNumericOrAlphabet(widget.isNumericOrAlphabet, value, widget.hintText)) {
                return widget.invalidText;
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}

bool isNumericOrAlphabet(bool check, String str, String hint) {
  if (check) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }
  if (hint.toLowerCase().contains('email')) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(str);
  }
  return RegExp("^[a-zA-Z]+\$").hasMatch(str);
}