import 'package:amemais/constants.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

   List<String> perguntas1 = [
    "Perunta um? Resposta exemplo um.",
    "Perunta dois? Resposta exemplo dois.",
    "Perunta três? Resposta exemplo três.",
    "Perunta quatro? Resposta exemplo quatro.",
  ];
  @override
  Widget build(BuildContext context) {

    String valueChoose;
    List listItem = [
      "Tema 1", "Tema 2","Tema 3","Tema 4","Tema 5"
    ];
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(25.0)
              ),
          child: DropdownButton<String>(
            //hint: Text("Tema selecionado: "),
            dropdownColor: AmeMaisColors.rosa,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              color:AmeMaisColors.black,
              fontSize: 22,
            ),
            value: valueChoose,
            onChanged: (newValue){
              setState(() {
                valueChoose = newValue;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => teste(valueChoose),),);
              });
            },
            items: listItem.map((valueItem){
              return DropdownMenuItem<String>(
                value: valueItem,
                child: Text(valueItem),
                
                );
            }).toList(),
         
          ),

            ),
          
        ),
        
      );
      
    }

    Widget teste( String text){
      return Scaffold(body:
       (Container(child: 
       Center(
        //child: Text("Selecionado"+"$valueChoose"),
         ),
         )
      ));
     
  }
  }
