//import 'package:amemais/Screens/papo_motivacional/components/body.dart';
import 'package:amemais/Screens/depoimento/depoimento.dart';
import 'package:amemais/Screens/papo_motivacional/components/body.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:amemais/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PapoScreen extends StatefulWidget {
  @override
  _PapoScreenState createState() => _PapoScreenState();
}

class _PapoScreenState extends State<PapoScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: Text('Papo Motivacional')),
      body: Body(),
       floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DepoimentoScreen(),),);
        } ,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor:AmeMaisColors.rosa,
      ),        
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Papo Motivacional')), 
        body:Body(),
         floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DepoimentoScreen(),),);
        } ,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor:AmeMaisColors.rosa,
      ),         
    );
    }

    // ignore: non_constant_identifier_names
    Widget Body(){
      var stream = FirebaseFirestore.instance.collection("papoMotivacional").doc("depoimentos").collection("depoimento").snapshots();
      return StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: Text("Please Wait..."));
            default:
            if (snapshot.hasData) {
              if(snapshot.data.docs.length == 0){
                return Center(child: Text("No Record Found"));
              }else{
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index){
                    String title = snapshot.data.docs[index]['title'];
                    String name = snapshot.data.docs[index]['name'];
                    String des = snapshot.data.docs[index]['description'];
                    
                    return Center(
                      child:Card(
                        child: Column(mainAxisSize: MainAxisSize.min,
                
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "$title\n", style: TextStyle(fontSize:20.0)),
                              subtitle: Text("$des\n \n\nDepoimento da $name\n", style: TextStyle(fontSize:15.0)),
                              
                              
                              
                            ),
                          Row( mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                         
                        /*FloatingActionButton(
                              onPressed:(){
                              addLike();
                              
                              } ,
                          child: Icon(Icons.thumb_up_outlined),
                          backgroundColor:AmeMaisColors.rosa,
                        ),*/
                          
                        const SizedBox(width: 8),

                  ]
                )
                ]
              )
            )
              
                    );      

                }
                );
              
              }
            }else{
              return Center(child: Text("Getting Error"));
            }
          }
        },
       
        );
    
    }

 /*  void addLike() async {
 
    FirebaseFirestore.instance.collection("papoMotivacional").doc("depoimentos").collection("depoimento").add({
      
      });
      
      Navigator.pop(context);
    
    }*/*/

}