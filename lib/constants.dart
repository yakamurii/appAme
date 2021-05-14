import 'package:amemais/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show Color;

const kPrimaryColor = Color(0xFFF2B3B3); //rosa
const kPrimaryLightColor = Color(0xFFC7ADD9); //lilas
const Color branco = Color(0xFFF2F2F2); //branco
const Color roxo = Color(0xFFA47ABF); // roxo
const Color black = Color(0xFF000000);
const kTextColor = Color(0xFFA47AB3);

class AmeMaisColors {
  static const rosa = Color(0xFFF2B3B3); //rosa
  static const lilas = Color(0xFFC7ADD9); //lilas
  static const Color branco = Color(0xFFF2F2F2); //branco
  static const Color roxo = Color(0xFFA47ABF); // roxo
  static const Color black = Color(0xFF000000);
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor digite seu E-mail";
const String kInvalidEmailError = "Please favor, digite um e-mail válido";
const String kPassNullError = "Por favor, Digite sua senha";
const String kShortPassError = "Senha é muito curta";
const String kMatchPassError = "Senhas não estão iguais";
const String kNamelNullError = "Por favor, digite seu nome";
const String kPhoneNumberNullError = "Por favor, digite seu telefone";
const String kAddressNullError = "Por favor, digite seu e-mail";
const String kIdadeError = "Por favor, digite sua idade";

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
