// import 'package:import_js_library/import_js_library.dart';

// import 'dart:js';

// import 'dart:js';

import 'package:amemais/Screens/sobre_aleitamento/sobre_aleitamento_screen.dart';
import 'package:amemais/Screens/sobre_bebe/sobre_bebe_screen.dart';
import 'package:amemais/Screens/termo_consentimento/termo_consentimento_screen.dart';
import 'package:amemais/Screens/Login/login_screen.dart';
import 'package:amemais/Screens/Signup/signup_screen.dart';
import 'package:amemais/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:amemais/Screens/anamnese/anamnese_screen.dart';
import 'package:amemais/Screens/forgot_password/forgot_password_screen.dart';
import 'package:amemais/Screens/aceitacao_termos/aceitacao_termos_screen.dart';

import 'Screens/details/details_screen.dart';
import 'Screens/home/home_screen.dart';
import 'Screens/profile/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  AnamneseScreen.routeName: (context) => AnamneseScreen(),
  TermoConsentimentoScreen.routeName: (context) => TermoConsentimentoScreen(),
  AceitacaoTermosScreen.routeName: (context) => AceitacaoTermosScreen(),
  SobreAleitamentoScreen.routeName: (context) => SobreAleitamentoScreen(),
  SobreOBebeScreen.routeName: (context) => SobreOBebeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
