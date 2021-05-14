import 'package:amemais/Screens/papo_motivacional/components/papoLista.dart';
import 'package:amemais/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //margin: EdgeInsets.all()
          //padding: EdgeInsets.symmetric(horizontal:),
         // child: Text("Este espaço é dedicado para compartilhar histórias, você deixar depoimentos e compartilhar experiências",
          //style: TextStyle(fontSize: 20),
          //textAlign: TextAlign.center,),
      ),
      //PapoLista(),
     // SizedBox(height: 50,),
      Expanded(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                //color: AmeMaisColors.lilas,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40) )
              )
            ),
            PapoLista(),
          ],
        ) 
        )
      ],
      
    );
  }


}