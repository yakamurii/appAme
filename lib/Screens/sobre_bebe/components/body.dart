import 'package:flutter/material.dart';
import 'package:amemais/Screens/Signup/components/background.dart';
import 'package:amemais/constants.dart';
import 'package:amemais/size_config.dart';
import 'sobre_bebe_form.dart';

class Body extends StatelessWidget {
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
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                // Text("Sobre Você", style: headingStyle),
                Container(
                  width: 250,
                  height: 100,
                  child: Image.asset('assets/images/sobrebebe.png'),
                ),

                Text(
                  "Para melhor acompanhamento consideramos necessária à coleta de alguns dados sobre você e o (a) seu (sua) bebê. Portanto, complete as informações abaixo corretamente. ",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),

                SobreOBebeForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
