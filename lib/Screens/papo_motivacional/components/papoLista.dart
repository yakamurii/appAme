import 'package:amemais/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PapoLista extends StatefulWidget {
  @override
  _PapoListaState createState() => _PapoListaState();
}

class _PapoListaState extends State<PapoLista> {
  @override
  Widget build(BuildContext context) {
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
                    double rate = snapshot.data.docs[index]['rating'];

                    
                    return Center(
                      child:Card(
                        child: Column(mainAxisSize: MainAxisSize.min,
                        
                
                          children: <Widget>[
                            
                            ListTile(
                             // title: Text(
                               // "$title\n", style: TextStyle(fontSize:20.0)),
                              subtitle: Text("$des\n \n\nDepoimento da $name", style: TextStyle(fontSize:15.0)),
                              
                              
                              
                            ),
                          Row( mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                          
                           Icon(Icons.star, size: 25, color: Colors.orange,),
                           Text("$rate"),
                           TextButton(
                            child: const Text('Avalie', style: TextStyle(color: AmeMaisColors.rosa)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                    builder: (BuildContext context) => _buildPopupDialog(context),
                                  );
                            }),
                         
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
  Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Avalie o depoimento'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       // Text("Hello"),
       SmoothStarRating(
              //rating: rating,
              borderColor: Colors.grey,
              color: Colors.orange,
              isReadOnly: false,
              size: 40,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              spacing: 1.0,
              onRated: (value) {
                print("rating value -> $value");
                //add(value);
            // print("rating value dd -> ${value.truncate()}");
              },
            ),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Enviar'),
      ),
    ],
  );
}
}