import 'package:flutter/material.dart';
import 'package:amemais/Screens/sobre_aleitamento/components/body.dart';

import '../../size_config.dart';

class SobreAleitamentoScreen extends StatelessWidget {
  static String routeName = "/sobre_aleitamento";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
