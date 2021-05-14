import 'package:amemais/Screens/aceitacao_termos/components/body.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class AceitacaoTermosScreen extends StatelessWidget {
  static String routeName = "/aceitacao_termos";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
