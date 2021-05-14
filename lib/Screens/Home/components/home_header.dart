import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.05),
          reading(),
         /* Text(
            "Bem vinda ao Ame+ " "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: AmeMaisColors.rosa,
              fontWeight: FontWeight.bold,
            ),
          ),*/
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 1,
            press: () {}, // ir para tela de notificações
          ),
        ],
      ),
    );
  }

Widget reading(){

   
    CollectionReference users = FirebaseFirestore.instance.collection('aboutMother');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        
        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text( "Bem vinda ao Ame+, ${data['firstName']}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: AmeMaisColors.rosa,
              fontWeight: FontWeight.bold,),
            );
            
           
        }

        return Text("loading");
      },
    );
  }

}
