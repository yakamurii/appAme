import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String title;
  String des;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(title: Text('Papo Motivacional')), 
        body: SingleChildScrollView(
          child: Container(padding: EdgeInsets.all(12.0,),
          child: Column( children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 12.0,),
              Form(child: Column(
                children: [
                  //TextFormField(
                   // decoration: InputDecoration.collapsed(
                    //  hintText: "Dê um título para sua história",),
               // style: TextStyle(
                 // fontSize: 25.0, 
                  //fontWeight: FontWeight.bold,
                  //color: AmeMaisColors.black
                 // ),
                //onChanged: (_val) {
                  //title = _val;
                //},),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                padding: const EdgeInsets.only(top: 12.0),
                child: TextFormField(decoration: InputDecoration.collapsed(hintText: "Nos conte AQUI a sua história!",),
                  style: TextStyle(fontSize: 20.0,color: AmeMaisColors.black),
                    onChanged: (_val) {
                    des = _val;
                    },
                    maxLines: 20,
                  ),
              ),
              ],
              ),
            ),
          ],
          ),
          ),
        ),
        bottomNavigationBar:RoundedButton(
                    text: "Postar",
                      press: () {
                          add();
                      } ,
        )
      ),
    );
  }

  void add() async {
  
  var name = await FirebaseFirestore.instance.collection("aboutMother").doc(FirebaseAuth.instance.currentUser.uid).get();
    
    FirebaseFirestore.instance.collection("papoMotivacional").doc("depoimentos").collection("depoimento").add({
      'id': FirebaseAuth.instance.currentUser.uid, 
      'name': name.get("firstName"),  
      'lastName': name.get("lastName"),
      'title': title,
      'description': des,
      'likes': 0, 
      });
      
      Navigator.pop(context);
    
    }
  }
