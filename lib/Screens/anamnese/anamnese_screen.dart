import 'package:flutter/material.dart';
import 'package:amemais/Screens/anamnese/components/body.dart';

import '../../size_config.dart';

class AnamneseScreen extends StatelessWidget {
  static String routeName = "/anamnese";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
