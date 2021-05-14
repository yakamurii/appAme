import 'package:flutter/material.dart';
import 'package:amemais/Screens/sobre_bebe/components/body.dart';

import '../../size_config.dart';

class SobreOBebeScreen extends StatelessWidget {
  static String routeName = "/sobre_bebe";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
