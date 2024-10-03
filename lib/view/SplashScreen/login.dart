// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import '../MyWidgite/buttons.dart';
import '../MyWidgite/textField.dart';
import '../../controller/loginAPI.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  "images/3.svg",
                  width: MediaQuery.of(context).size.width/1.3,
                ),
                              const SizedBox(
              height: 20,
                              ),
                              Text(
              'Enter your Username'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 76, 77, 220),
              ),
                              ),
                              Text(
              "And Password".tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 76, 77, 220),
              ),
                              ),
                              const SizedBox(
              height: 40,
                              ),
                              Padding(
              padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
              child: textFieldCustom(
                  controler: username, labelText: "UserName".tr),
                              ),
                              const SizedBox(
              height: 10,
                              ),
                              Padding(
              padding: EdgeInsets.only(left: _w * 0.08, right: _w * 0.08),
              child: textFieldCustom(
                obscureText: true,
                  controler: password, labelText: "Password".tr),
                              ),
                              const SizedBox(
              height: 50,
                              ),
                              MaterialButtonCustom(
              materialtext: 'Login'.tr,
              onpressed: () async {
              if(username.text.isNotEmpty && password.text.isNotEmpty){
                await LoginAccount(context).loginAccount(username.text, password.text);
              }
              else{
                showSnackBar(context, "Not Allow Null Value", Colors.redAccent, false);
              }
              },
              color: const Color.fromARGB(255, 76, 77, 220),
                              ),
                            ]),
            ],
          ),
        ),
      ),
    );
  }
}
