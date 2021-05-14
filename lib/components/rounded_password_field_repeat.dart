import 'package:flutter/material.dart';
import 'package:amemais/components/text_field_container.dart';
import 'package:amemais/constants.dart';

class RoundedPasswordFieldRepeat extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordFieldRepeat({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: " Repita a Senha",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
