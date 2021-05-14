import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: AmeMaisColors.branco,
    fontFamily: "Muli",
    textTheme: TextTheme(bodyText1: TextStyle(color: AmeMaisColors.branco)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
