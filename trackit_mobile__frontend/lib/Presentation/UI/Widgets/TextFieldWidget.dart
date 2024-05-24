import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hinttext;
  final bool type;
  final String? errortext;
  const TextFieldWidget(
      {Key? key,
      required this.hinttext,
      required this.type,
      required this.controller,
      required this.errortext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.pink),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              errorText: errortext),
          obscureText: type,
          controller: controller,
        ),
      ),
    );
  }
}
