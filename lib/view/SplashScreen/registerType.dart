// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel/view/SplashScreen/customerRegister.dart';
import '../HotelScreen/HotelRegister.dart';
import '../MyWidgite/buttons.dart';

class registerType extends StatefulWidget {
  const registerType({super.key});

  @override
  State<registerType> createState() => _registerTypeState();
}

class _registerTypeState extends State<registerType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            "images/2.svg",
            width: MediaQuery.of(context).size.width/1.3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "Select your Account Type".tr,
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
            "Customer or Hotel Admin ".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButtonCustom(
            materialtext: 'I`m a Customer'.tr,
            onpressed: () {
              Get.to(() => const customerRegister());
            },
            color: const Color.fromARGB(255, 76, 77, 220),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButtonCustom(
            materialtext: 'I`m a Hotel Admin'.tr,
            onpressed: () {
              Get.to(() => const HotelRegister());
            },
            color: const Color.fromARGB(255, 76, 77, 220),
          )
        ]),
      ),
    );
  }
}
