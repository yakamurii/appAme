import 'package:amemais/Screens/Home/home_screen.dart';
import 'package:amemais/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:amemais/constants.dart';
import 'package:amemais/size_config.dart';
import 'package:amemais/components/rounded_password_field_repeat.dart';
import 'package:flutter/material.dart';
import 'package:amemais/Screens/Login/login_screen.dart';
import 'package:amemais/Screens/Signup/components/background.dart';
import 'package:amemais/Screens/Signup/components/or_divider.dart';
import 'package:amemais/Screens/Signup/components/social_icon.dart';
import 'package:amemais/components/already_have_an_account_acheck.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/components/rounded_input_field.dart';
import 'package:amemais/components/rounded_password_field.dart';
import 'package:amemais/components/default_button.dart';
import 'package:amemais/components/form_error.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../error_handler.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {

  var token;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    color: AmeMaisColors.roxo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Complete seu cadastro ou faça Login com \n Google ou Facebook",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/ame_icon.png'),
                ),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
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
                ),

                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Para continuar você tem que aceitar \n nossos termos e condições',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
