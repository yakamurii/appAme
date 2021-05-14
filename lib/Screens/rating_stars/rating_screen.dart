import 'package:amemais/Screens/rating_stars/components/body.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nos Avalie"),
      ),
      body: Body(),
    );
}
}