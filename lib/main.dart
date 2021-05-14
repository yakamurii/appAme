import 'package:amemais/services/authservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:amemais/routes.dart';
import 'package:amemais/theme.dart';
import 'package:flutter/material.dart';
import 'package:amemais/Screens/Welcome/welcome_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:amemais/constants.dart';
// import 'constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ame+',
      theme: theme(),
      initialRoute: WelcomeScreen.routeName,
      routes: routes,
    );
  }
}
