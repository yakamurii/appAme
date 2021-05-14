import 'package:amemais/Screens/sobre_aleitamento/sobre_aleitamento_screen.dart';
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

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName; //ok
  String lastName; //ok
  String idade; //
  String raca; //ok
  String dLicencaMaternidade;
  String address; //ok
  String estado; //ok
  String country; //ok
  String escolaridade; //ok
  String licencaMaternidade; //ok
  String nFilhos;
  String nDiasPosParto;
  String estadoCivil;
  String moraCom;
  // raca
  String selectRaca = "";
  final racasSelected = TextEditingController();
  List<String> racas = [
    "Branca",
    "Parda",
    "Amarela",
    "Indígena",
    "Preta",
  ];
  //estados
  String selectEstado = "";
  final estadoSelected = TextEditingController();
  List<String> estados = [
    "AC",
    "AL",
    "AP",
    "AM",
    "BA",
    "CE",
    "DF",
    "ES",
    "GO",
    "MA",
    "MT",
    "MS",
    "MG",
    "PA",
    "PB",
    "PR",
    "PE",
    "PI",
    "RJ",
    "RN",
    "RS",
    "RO",
    "RR",
    "SC",
    "SP",
    "SE",
    "TO",
  ];
  //escolaridade
  String selectEscolaridade = "";
  final escolaridadeSelected = TextEditingController();
  List<String> escolaridades = [
    "Ensino fundamental incompleto",
    "Ensino fundamental completo",
    "Ensino médio incompleto",
    "Ensino médio completo",
    "Superior Completo",
    "Superior incompleto",
    "Pós Graduação"
  ];
  //licenca maternidade
  String selectLicencaMaternidade = "";
  final licencaMaternidadeSelected = TextEditingController();
  List<String> licencas = [
    "Trabalho e tive direito a tirar licença",
    "Trabalho e não tive direito a tirar licença",
    "Não trabalho",
  ];
  //Numero de filhos
  String selectNumeroDeFihos = "";
  final numeroDeFilhosSelected = TextEditingController();
  List<String> filhos = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  //Numero de dias pos Parto
  String selectDiasPosParto = "";
  final diasPosPartoSelected = TextEditingController();
  List<String> diasPosParto = [
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
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "2 meses",
    "3 meses",
    "4 meses",
    "5 meses",
    "6 meses"
  ];
  //Estado Civil
  String selectEstadoCivil = "";
  final estadoCivilSelected = TextEditingController();
  List<String> estadosCivil = [
    "Solteira",
    "Casada",
    "Separada",
    "Divorciada",
    "Viuva",
  ];
  //Moradia
  String selectMoradia = "";
  final moradiaSelected = TextEditingController();
  List<String> moradia = [
    "Cônjugue",
    "Familiares",
    "Amigos",
    "Sozinho",
    "Outro",
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
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildIdadeField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildRacaField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEstadoField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildCountryFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildEscolaridadeField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildLicencaMaternidadeField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildDiasLicensaField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildNumeroDeFilhosField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildDiasPosPartoField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildEstadoCivilField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildMoradiaField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          RoundedButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                add();
                Navigator.pushNamed(context, SobreAleitamentoScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
         // removeError(error: kAddressNullError);
        }
        //return null;
        address = value;
      },
      validator: (value) {
        if (value.isEmpty) {
         // addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Endereço",
        hintText: "Digite seu Endereço (Rua, Bairro e N°)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildIdadeField() {
    return TextFormField(
      onSaved: (newValue) => idade = newValue,
      validator: (value){
        if (value.isEmpty) {
         // addError(error: kIdadeError);
          return "";
        }
        //return null;
        idade= value;
      },
      decoration: InputDecoration(
        labelText: "Idade",
        hintText: "Digite sua idade",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  DropDownField buildRacaField() {
    return DropDownField(
      controller: racasSelected,
      hintText: "Selecione sua Raça",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 5,
      items: racas,
      onValueChanged: (value) {
        setState(() {
          selectRaca = value;
        });
        raca = value;
      },
      
    );
  }

  DropDownField buildEstadoField() {
    return DropDownField(
      controller: estadoSelected,
      hintText: "Selecione seu Estado",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 5,
      items: estados,
      onValueChanged: (value) {
        setState(() {
          selectEstado = value;
        });
        estado = value;
      },
    );
  }

  DropDownField buildEscolaridadeField() {
    return DropDownField(
      controller: escolaridadeSelected,
      hintText: "Escolaridade",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 5,
      items: escolaridades,
      onValueChanged: (value) {
        setState(() {
          selectEscolaridade = value;
        });
        escolaridade = value;
      },
    );
  }

  DropDownField buildLicencaMaternidadeField() {
    return DropDownField(
      controller: licencaMaternidadeSelected,
      hintText: "Licença Maternidade",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 3,
      items: licencas,
      onValueChanged: (value) {
        setState(() {
          selectLicencaMaternidade = value;
        });
        licencaMaternidade = value;
      },
    );
  }

  DropDownField buildNumeroDeFilhosField() {
    return DropDownField(
      controller: numeroDeFilhosSelected,
      hintText: "Número de Filhos",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 5,
      items: filhos,
      onValueChanged: (value) {
        setState(() {
          selectNumeroDeFihos = value;
        });
        nFilhos = value;
      },
    );
  }

  DropDownField buildDiasPosPartoField() {
    return DropDownField(
      controller: diasPosPartoSelected,
      hintText: "Dias Pós-Parto",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 5,
      items: diasPosParto,
      onValueChanged: (value) {
        setState(() {
          selectDiasPosParto = value;
        });
        diasPosParto = value;
      },
    );
  }

  DropDownField buildEstadoCivilField() {
    return DropDownField(
      controller: estadoCivilSelected,
      hintText: "Estado Civil",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 5,
      items: estadosCivil,
      onValueChanged: (value) {
        setState(() {
          selectEstadoCivil = value;
        });
        estadoCivil = value;
      },
    );
  }

  DropDownField buildMoradiaField() {
    return DropDownField(
      controller: moradiaSelected,
      hintText: "Mora Com",
      enabled: true,
      // required: true,
      itemsVisibleInDropdown: 5,
      items: moradia,
      onValueChanged: (value) {
        setState(() {
          selectMoradia = value;
        });
        moraCom = value;
      },
    );
  }

  TextFormField buildCountryFormField() {
    return TextFormField(
      onSaved: (newValue) => country = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kNamelNullError);
        }
        country = value;
      },
      decoration: InputDecoration(
        labelText: "País",
        hintText: "Digite o nome do seu País",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/country.svg"),
      ),
    );
  }

  TextFormField buildDiasLicensaField() {
    return TextFormField(
      onSaved: (newValue) => licencaMaternidade = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kNamelNullError);
        }
        dLicencaMaternidade = value;
      },
      decoration: InputDecoration(
        labelText: "Se você teve licença maternidade",
        hintText: "Digite o numero de dias de licença",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/country.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kNamelNullError);
        }
        lastName = value;
      },
      decoration: InputDecoration(
        labelText: "Sobrenome",
        hintText: "Digite seu sobrenome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kNamelNullError);
        }
        //return null;
        firstName = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Primeiro Nome",
        hintText: "Digite seu primeiro nome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
void add() async {

   

    var data = {
     'firstName': firstName,
     'lastName':lastName,
     'idade':idade,
     'raca':raca,
     'address':address,
     'estado':estado,
     'country': country,
     'escolaridade': escolaridade,
     'licencaMaternidade': licencaMaternidade,
     'dLicencaMaternidade': dLicencaMaternidade,
     'nFilhos': nFilhos,
     'nDiasPosParto': nDiasPosParto,
     'estadoCivil': estadoCivil,
     'moraCom': moraCom,

    };
    
    FirebaseFirestore.instance
        .collection('aboutMother')
        .doc(FirebaseAuth.instance.currentUser.uid).set(data);

  }

}


