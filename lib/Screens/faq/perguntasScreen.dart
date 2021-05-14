import 'package:amemais/Screens/faq/components/body.dart';
import 'package:flutter/material.dart';

class PerguntasScreen extends StatefulWidget {
  @override
  _PerguntasScreenState createState() => _PerguntasScreenState();
}

class _PerguntasScreenState extends State<PerguntasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perguntas Frequentes')),
      body: Body(),
    );
  }
}