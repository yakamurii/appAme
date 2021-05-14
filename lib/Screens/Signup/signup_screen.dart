import 'package:flutter/material.dart';
import 'package:amemais/Screens/Signup/components/body.dart';

import '../../size_config.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signup";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
