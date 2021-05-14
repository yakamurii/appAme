import 'package:amemais/Screens/Login/components/social_icon.dart';
import 'package:amemais/Screens/anamnese/anamnese_screen.dart';
import 'package:amemais/Screens/details/details_screen.dart';
import 'package:amemais/Screens/forgot_password/forgot_password_screen.dart';
import 'package:amemais/Screens/home/home_screen.dart';
import 'package:amemais/Screens/profile/profile_screen.dart';
// import 'package:amemais/Screens/home/home_screen.dart';
import 'package:amemais/Screens/termo_consentimento/termo_consentimento_screen.dart';
import 'package:flutter/material.dart';
import 'package:amemais/Screens/Login/components/background.dart';
import 'package:amemais/Screens/Signup/signup_screen.dart';
import 'package:amemais/components/already_have_an_account_acheck.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/components/rounded_input_field.dart';
import 'package:amemais/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amemais/services/authservice.dart';

import '../../../constants.dart';
import 'or_divider.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  String email;
  String password;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AmeMaisColors.rosa),
            ),
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/ame_icon.png'),
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Digite Seu Email",
              onChanged: (value) {
               email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    //AuthService().handleAuth();  
                  },
                ),
                Text("Lembrar-me"),
                Spacer(),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName),
                    child: Text(
                      "Esqueci minha senha",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            ),

            RoundedButton(
              text: "Login",
              press: () {
                AuthService().signIn(this.email, this.password, context);
              },
            ),

            SizedBox(height: size.height * 0.04),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {
                    AuthService().fbSignIn();
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {
                    AuthService().signInWithGoogle();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
