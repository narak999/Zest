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

bool isNumericOrAlphabet(bool checkForNumericOrAlphabet, String str, String hint) {
  if (checkForNumericOrAlphabet) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }
  if (hint.toLowerCase().contains('email')) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(str);
  } else if (hint.toLowerCase().contains('password')) {
    return isPasswordValid(str);
  }
  return RegExp("^[a-zA-Z]+\$").hasMatch(str);
}

bool isPasswordValid(String password) {
  if (password == null || password.isEmpty || password.length < 8) {
    return false;
  }

  bool hasNumber = false;
  bool hasSymbol = false;
  int repeatedChars = 1;
  String previousChar = password[0];

  for (int i = 1; i < password.length; i++) {
    String currentChar = password[i];

    if (currentChar == previousChar) {
      repeatedChars++;
      if (repeatedChars > 3) {
        return false;
      }
    } else {
      repeatedChars = 1;
    }

    if (currentChar.contains(RegExp(r'[0-9]'))) {
      hasNumber = true;
    } else if (currentChar.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      hasSymbol = true;
    }

    previousChar = currentChar;
  }

  return hasNumber && hasSymbol;
}