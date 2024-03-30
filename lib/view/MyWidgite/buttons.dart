// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MaterialButtonCustom extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  MaterialButtonCustom(
      {required this.materialtext,
      required this.onpressed,
      required this.color});
  String materialtext;
  VoidCallback onpressed;
  Color color;

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;

    return MaterialButton(
      height: _h * 0.09,
      minWidth: _w * 0.7,
      onPressed: onpressed,
      color: color,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      child: Text(materialtext,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}
