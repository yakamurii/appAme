import 'package:amemais/Screens/Login/login_screen.dart';
import 'package:amemais/Screens/anamnese/anamnese_screen.dart';
import 'package:amemais/Screens/forgot_password/components/background.dart';
import 'package:amemais/constants.dart';
import 'package:flutter/material.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/components/rounded_input_field.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Consentimento Livre e Esclarecido",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: AmeMaisColors.rosa,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Estou de acordo com a participação no estudo descrito. Fui devidamente esclarecido (a) quanto aos objetivos da pesquisa, ao (s) procedimento (s) ao (s) qual (is) serei submetido e dos possíveis riscos que possam advir de minha participação. Foram-me garantidos esclarecimentos que eu venha a solicitar durante o curso da pesquisa e o direito de desistir da participação em qualquer momento, sem que minha desistência implique em qualquer prejuízo a minha pessoa ou a minha família. Caso minha participação na pesquisa implique em algum gasto, serei ressarcido e caso sofra algum dano, serei indenizado. Autorizo assim a publicação dos dados desta pesquisa, sendo-me garantido o meu anonimato e o sigilo dos dados referentes à minha identificação.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                  color: Colors.black,
                ),
              ),
              ListTile(
                leading: Checkbox(
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                      if (value == true) {
                        Navigator.pushNamed(context, AnamneseScreen.routeName);
                      }
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.black,
                ),
                title: Text(
                  'Li e concordo com os termos de uso',
                  style: TextStyle(
                    color: AmeMaisColors.rosa,
                  ),
                ),
              ),
              ListTile(
                leading: Checkbox(
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                      if (value == true) {
                        Navigator.pushNamed(context, AnamneseScreen.routeName);
                      }
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.black,
                ),
                title: Text(
                  'Não concordo com os termos de uso',
                  style: TextStyle(
                    color: AmeMaisColors.rosa,
                  ),
                ),
              ),

              // SizedBox(height: SizeConfig.screenHeight * 0.80),
            ],
          ),
        ),
      ),
    );
  }
}
