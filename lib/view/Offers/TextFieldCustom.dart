// ignore_for_file: file_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class textFieldCustom extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  textFieldCustom({required this.controler, required this.labelText});
  TextEditingController controler;
  String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 3,
                color: Color.fromARGB(255, 76, 77, 220),
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 10, color: Colors.black)),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey)),
    );
  }
}

class Textfromfild extends StatelessWidget {
  Textfromfild(
      {required this.suffixicon,
      required this.prefixicon,
      required this.controllertxt,
      required this.hinttext,
      required this.txtInputType,
      super.key});
  Widget suffixicon;
  Widget prefixicon;
  TextEditingController controllertxt;
  String hinttext;
  TextInputType txtInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: TextFormField(
        controller: controllertxt,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        keyboardType: txtInputType,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
          prefixIcon: prefixicon,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          hintText: "$hinttext",
          hintStyle: TextStyle(color: Colors.white60),
        ),
      ),
    );
  }
}
