import 'package:flutter/material.dart';
import 'package:amemais/Screens/Login/login_screen.dart';
import 'package:amemais/Screens/Signup/signup_screen.dart';
import 'package:amemais/Screens/Welcome/components/background.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bem vinda ao Ame+",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AmeMaisColors.rosa),
            ),
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/ame_icon.png'),
            ),
            SizedBox(height: size.height * 0.05),
            // SvgPicture.asset(
            //   "assets/icons/ame_icon.svg",
            //   height: size.height * 0.45,
            // ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
                // context,
                // MaterialPageRoute(
                //   builder: (context) {
                //     return LoginScreen();
                //   },
                // ),
              },
            ),
            RoundedButton(
              text: "Cadastre-se",
              color: kPrimaryLightColor,
              textColor: Colors.white,
              press: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
                // context,
                // MaterialPageRoute(
                //   builder: (context) {
                //     return SignUpScreen();
                //   },
                // ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
