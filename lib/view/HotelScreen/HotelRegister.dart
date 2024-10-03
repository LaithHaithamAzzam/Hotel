// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/CreateHotelProvider.dart';
import 'package:hotel/Providers/ImageProvider.dart';
import 'package:hotel/controller/GetallLocations.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:provider/provider.dart';
import '../MyWidgite/ChoiseImage.dart';
import '../MyWidgite/buttons.dart';
import '../MyWidgite/textField.dart';

class HotelRegister extends StatefulWidget {
  const HotelRegister({super.key});

  @override
  State<HotelRegister> createState() => _HotelRegisterState();
}

TextEditingController name = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class _HotelRegisterState extends State<HotelRegister> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: () async {
                          await choisimage(context);
                        },
                        child: Consumer<Imageprovider>(
                          builder: (context, Prov, child) {
                            return CircleAvatar(
                                minRadius: 110,
                                backgroundColor:
                                    Color.fromARGB(255, 76, 77, 220),
                                backgroundImage: Prov.image != null
                                    ? Image.file(
                                        File(Prov.image!.path),
                                        fit: BoxFit.cover,
                                      ).image
                                    : null,
                                child: Prov.image == null
                                    ? Text(
                                        "Your Profile Image".tr,
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(""));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                        child: textFieldCustom(
                            controler: name, labelText: "Hotel Name".tr),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                        child: textFieldCustom(
                            controler: username, labelText: "User Name".tr),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, left: _w * 0.08, right: _w * 0.08),
                        child: textFieldCustom(
                            controler: password, labelText: "Password".tr),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                        child: textFieldCustom(
                            controler: confirmpassword,
                            labelText: "Confirm Password".tr),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MaterialButtonCustom(
                        materialtext: 'Next'.tr,
                        onpressed: () async {
                          if(username.text.isNotEmpty && password.text.isNotEmpty && confirmpassword.text.isNotEmpty){
                            if (password.text == confirmpassword.text) {
                              Provider.of<CreateHotelProvider>(context,
                                      listen: false)
                                  .AddHotel(
                                      name.text, username.text, password.text);
                              await GetAllLocations(context).getAllLocations();
                            } else {
                              showSnackBar(
                                  context,
                                  "Your Repassword Is Not True",
                                  Colors.redAccent,
                                  false);
                            }
                          } else{
                            showSnackBar(context, "Not Allow Null Value", Colors.redAccent, false);
                          }
                        },
                        color: const Color.fromARGB(255, 76, 77, 220),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
