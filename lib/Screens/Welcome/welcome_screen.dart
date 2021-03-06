import 'package:flutter/material.dart';
import 'package:amemais/Screens/Welcome/components/body.dart';

import '../../size_config.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcome";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
