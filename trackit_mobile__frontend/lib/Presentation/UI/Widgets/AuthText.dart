import 'package:flutter/material.dart';

class Authtext extends StatelessWidget {
  final String hintText;
  const Authtext({super.key,required this.hintText});



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}