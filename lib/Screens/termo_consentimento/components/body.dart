import 'package:amemais/Screens/forgot_password/components/background.dart';
import 'package:amemais/constants.dart';
import 'package:flutter/material.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/components/rounded_input_field.dart';
import 'package:amemais/Screens/aceitacao_termos/aceitacao_termos_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
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
                "Termo de consentimento livre e esclarecido",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: AmeMaisColors.rosa,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Este é um convite para você participar das pesquisas que serão realizadas através dos dados registrados nesta plataforma, a presente pesquisa tem por objetivo validar esta tecnologia educacional (aplicativo ame+) para promoção do aleitamento materno e prevenção de intercorrências mamarias. Segue as recomendações da resolução 466/12 do conselho nacional de saúde e suas complementares. Justifica-se a relevância deste trabalho em virtude da necessidade de estratégias de promoção à amamentação, visto que é frequente a interrupção do aleitamento materno nos primeiros dias após o parto, devido a incidência de intercorrências mamarias. Assim, os dados aqui registrados contribuirão com a promoção do aleitamento materno e prevenção de complicações mamarias entre gestantes e puérperas. Neste ínterim, a Lei N° 12.527/2011 regulamenta o direito constitucional de acesso às informações públicas. Essa norma entrou em vigor em 16 de maio de 2012 e criou mecanismos que possibilitam a qualquer pessoa, física ou jurídica, o recebimento de informações públicas dos órgãos e entidades. Caso decida aceitar o convite, você responderá a um questionário estruturado com informações  sobre dados sócio demográficos, gestação, conhecimentos sobre aleitamento materno e sobre o bebê. Posteriormente, você poderá utilizar este aplicativo de celular sobre aleitamento materno construído através da pesquisa e poderá nos avaliar através de curtos questionários dispostos no ame+, assim como, registrar seu feedback quanto à compreensão, atratividade e aplicação do instrumento educacional em apreço. Os riscos com sua participação na pesquisa serão o da exposição de dados sigilosos e de constrangimento. No entanto, serão tomadas todas as medidas no sentido de minimizá-los, uma vez que os dados obtidos a partir dos questionários estarão sob rigorosa proteção e vigilância e a coleta de dados ocorrerá sempre em ambiente privativo, confortável, escolhido pelo entrevistado e com orientação ética adequada quanto aos objetivos do instrumento. Você terá como benefício ao participar da pesquisa, colaborar com a construção de uma ferramenta de educação em saúde e a partir dela, ter acesso à prevenção de complicações mamárias e à promoção do aleitamento materno.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                  color: Colors.black,
                ),
              ),
              // SizedBox(height: SizeConfig.screenHeight * 0.80),
              RoundedButton(
                text: "Continuar",
                press: () {
                  Navigator.pushNamed(context, AceitacaoTermosScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
