import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  TextEditingController? controller;
  bool? obscureText;
  Widget ?suffixIcon;
  Widget ?prefixIcon;
  String ? hintText;

  CommonTextField({super.key,this.controller,this.obscureText=false,this.suffixIcon,this.hintText,this.prefixIcon});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText!,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.green, width: 2))),
    );
  }
}
