import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final Color color;
  final TextEditingController controller;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: widget.color, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: widget.color,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
          obscureText: _obscureText,
        ),
      ),
    );
  }
}
