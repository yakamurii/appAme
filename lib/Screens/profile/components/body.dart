import 'package:amemais/Screens/rating_stars/rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:amemais/services/authservice.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Meu Perfil",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Bancos de Leite",
            icon: "assets/icons/feeding-bottle.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Configurações",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Precisa de Ajuda?",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Nos Avalie",
            icon: "assets/icons/Star Icon.svg",
            press: () {
              Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RatingScreen(),),);
            },
          ),
          ProfileMenu(
            text: "Sair",
            icon: "assets/icons/Log out.svg",
            press: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
    );
  }
}
