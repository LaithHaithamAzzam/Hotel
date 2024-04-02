// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel/view/SplashScreen/customerRegister.dart';
import 'package:hotel/view/SplashScreen/login.dart';
import '../MyWidgite/buttons.dart';


class loginAndRegisterScreen extends StatefulWidget {
  const loginAndRegisterScreen({super.key});

  @override
  State<loginAndRegisterScreen> createState() => _loginAndRegisterScreenState();
}

class _loginAndRegisterScreenState extends State<loginAndRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            "images/1.svg",
            width: MediaQuery.of(context).size.width/1.3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "Login or Create Account".tr,
              style: const TextStyle(
                  color: Color.fromARGB(255, 76, 77, 220),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Select Login or create Account'.tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'for Booking The Hotel'.tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButtonCustom(
            materialtext: 'Login'.tr,
            onpressed: () {
              Get.to(() => const Login());
            },
            color: const Color.fromARGB(255, 76, 77, 220),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButtonCustom(
            materialtext: 'Create Account'.tr,
            onpressed: () {
              Get.to(() => const customerRegister());
            },
            color: const Color.fromARGB(255, 76, 77, 220),
          )
        ]),
      ),
    );
  }
}
