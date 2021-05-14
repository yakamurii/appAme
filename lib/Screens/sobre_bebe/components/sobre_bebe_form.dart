import 'package:amemais/Screens/Home/home_screen.dart';
import 'package:amemais/components/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:amemais/components/custom_surfix_icon.dart';
import 'package:amemais/components/default_button.dart';
import 'package:amemais/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SobreOBebeForm extends StatefulWidget {
  @override
  _SobreOBebeFormState createState() => _SobreOBebeFormState();
}

class _SobreOBebeFormState extends State<SobreOBebeForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName; //ok
  String idade; //
  String sexo; //ok
  String peso; //ok
  String comprimento; //ok
  String tipoParto; //ok
  String ifMamou; //ok

  String selectIdade = "";
  final idadeSelected = TextEditingController();
  List<String> idades = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
  ];
  //sexo do bebe
  String selectSexo = "";
  final sexoSelected = TextEditingController();
  List<String> sexoBebe = ["Masculino", "Feminino"];
  //Tipo de parto
  String selectTipoDeParto = "";
  final tipoDePartoSelected = TextEditingController();
  List<String> tiposDeParto = [
    "Normal",
    "Cesárea",
  ];
  //Se o Bebê mamou
  String selectIfMamou = "";
  final ifMamouSelected = TextEditingController();
  List<String> mamou = [
    "Sim",
    "Não",
  ];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildIdadeField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildSexoField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPesoFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildComprimentoFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildTipoDePartoField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildIfMamouField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          RoundedButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                add();
                Navigator.pushNamed(context, HomeScreen.routeName);
                // Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  DropDownField buildIdadeField() {
    return DropDownField(
      controller: idadeSelected,
      hintText: "Meses do Bebê",
      enabled: true,
     // required: true,
      itemsVisibleInDropdown: 5,
      items: idades,
      onValueChanged: (value) {
        setState(() {
          selectIdade = value;
        });
        idade = value;
      },
    );
  }

  DropDownField buildSexoField() {
    return DropDownField(
      controller: sexoSelected,
      hintText: "Sexo do Bebê",
      enabled: true,
      //required: true,
      itemsVisibleInDropdown: 5,
      items: sexoBebe,
      onValueChanged: (value) {
        setState(() {
          selectSexo = value;
        });
        sexo = value;
      },
    );
  }

  DropDownField buildTipoDePartoField() {
    return DropDownField(
      controller: tipoDePartoSelected,
      hintText: "Tipo De Parto",
      enabled: true,
      //required: true,
      itemsVisibleInDropdown: 5,
      items: tiposDeParto,
      onValueChanged: (value) {
        setState(() {
          selectTipoDeParto = value;
        });
        tipoParto = value;
      },
    );
  }

  DropDownField buildIfMamouField() {
    return DropDownField(
      controller: ifMamouSelected,
      hintText: "Mamou na Primeira hora de Vida?",
      enabled: true,
      //required: true,
      itemsVisibleInDropdown: 3,
      items: mamou,
      onValueChanged: (value) {
        setState(() {
          selectIfMamou = value;
        });
        ifMamou = value;
      },
    );
  }

  TextFormField buildPesoFormField() {
    return TextFormField(
      onSaved: (newValue) => peso = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //                                                                                                                                      removeError(error: kNamelNullError);
        }
        peso = value;
      },
      decoration: InputDecoration(
        labelText: "Peso",
        hintText: "Peso do Bebê em kg",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/weight.svg"),
      ),
    );
  }

  TextFormField buildComprimentoFormField() {
    return TextFormField(
      onSaved: (newValue) => comprimento = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kNamelNullError);
        }
        comprimento = value;
      },
      decoration: InputDecoration(
        labelText: "Comprimento",
        hintText: "Comprimento em cm",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/fish.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
         // removeError(error: kNamelNullError);
        }
        //return null;
        firstName = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          //addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: " Nome",
        hintText: "Nome do Bebê",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

   void add() async {
    var data = {
      'firstName': firstName,
      'idade': idade,
      'sexo': sexo,
      'peso': peso,
      'comprimento': comprimento,
      'tipoParto': tipoParto,
      'ifMamou':ifMamou,
    };
    
    FirebaseFirestore.instance
        .collection('aboutBaby')
        .doc(FirebaseAuth.instance.currentUser.uid).set(data);

  }
}



