import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextButtonforHotel extends StatelessWidget {
   TextButtonforHotel({ this.text,this.width,this.hight ,this.color , required this.onpressed, super.key});
   String? text;
   Color? color;
   double? width;
   double? hight;
   VoidCallback onpressed;
   @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text("$text" , textAlign: TextAlign.center,),
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          backgroundColor: MaterialStatePropertyAll(color),
          maximumSize:MaterialStatePropertyAll(
              Size(width!, hight!)),
          minimumSize: MaterialStatePropertyAll(
              Size(width!, hight!)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))))),
    );
  }
}
