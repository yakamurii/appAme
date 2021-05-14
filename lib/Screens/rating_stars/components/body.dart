import 'dart:ffi';

import 'package:amemais/Screens/Login/components/social_icon.dart';
import 'package:amemais/Screens/anamnese/anamnese_screen.dart';
import 'package:amemais/Screens/details/details_screen.dart';
import 'package:amemais/Screens/forgot_password/forgot_password_screen.dart';
import 'package:amemais/Screens/home/home_screen.dart';
import 'package:amemais/Screens/profile/profile_screen.dart';
// import 'package:amemais/Screens/home/home_screen.dart';
import 'package:amemais/Screens/termo_consentimento/termo_consentimento_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:amemais/Screens/Login/components/background.dart';
import 'package:amemais/Screens/Signup/signup_screen.dart';
import 'package:amemais/components/already_have_an_account_acheck.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/components/rounded_input_field.dart';
import 'package:amemais/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:amemais/services/authservice.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../constants.dart';


class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  String email;
  String password;
  bool value = false;
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(onPressed: (){
              showDialog(context: context, barrierDismissible: true, builder: (context){
                return RatingDialog(
                    title: "Avaliação", 
                    message: "Nos avalie", 
                    image: Icon(Icons.star, size: 100, color: Colors.orange,), 
                    submitButton: "Submeter", 
                    onSubmitted: (response){
                    print("onSubmitted Pressed: rating = ${response.rating}");
                    add(response.rating);
              }
          );
      });
                                                            },
            child: Text("Avalie"),),
            /*SmoothStarRating(
              //rating: rating,
              borderColor: Colors.grey,
              color: Colors.yellow,
              isReadOnly: false,
              size: 80,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              spacing: 2.0,
              onRated: (value) {
                print("rating value -> $value");
                add(value);
            // print("rating value dd -> ${value.truncate()}");
              },
            ),*/

            SizedBox(height: size.height * 0.04), 
          ],
        ),
      ),
    );

    
  }
  
  void add(int rate) async {
  
  var name = await FirebaseFirestore.instance.collection("aboutMother").doc(FirebaseAuth.instance.currentUser.uid).get();
    
    FirebaseFirestore.instance.collection("rating").doc(FirebaseAuth.instance.currentUser.uid).collection("rate").add({
      'id': FirebaseAuth.instance.currentUser.uid, 
      'name': name.get("firstName"),  
      'rating': rate,
      });
 
    
    }

    
}
