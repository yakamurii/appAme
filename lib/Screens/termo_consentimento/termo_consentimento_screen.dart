import 'package:amemais/Screens/termo_consentimento/components/body.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class TermoConsentimentoScreen extends StatelessWidget {
  static String routeName = "/termo";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
