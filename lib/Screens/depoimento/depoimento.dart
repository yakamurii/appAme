import 'package:amemais/Screens/depoimento/components/body.dart';
import 'package:flutter/material.dart';

class DepoimentoScreen extends StatefulWidget {
  @override
  _DepoimentoScreenState createState() => _DepoimentoScreenState();
}

class _DepoimentoScreenState extends State<DepoimentoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}