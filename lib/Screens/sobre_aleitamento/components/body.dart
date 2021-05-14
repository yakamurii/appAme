import 'package:flutter/material.dart';
import 'package:amemais/Screens/Signup/components/background.dart';
import 'package:amemais/constants.dart';
import 'package:amemais/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'sobre_aleitamento_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(0.5)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text("Sobre Aleitamento",
                    style: TextStyle(
                      color: AmeMaisColors.roxo,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  width: 250,
                  height: 100,
                  child: SvgPicture.asset('assets/icons/breastfeeding.svg'),
                ),
                Text(
                  "Para melhor acompanhamento consideramos necessária à coleta de alguns dados sobre você e o (a) seu (sua) bebê. Portanto, complete as informações abaixo corretamente. ",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SobreAleitamentoForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
