import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:provider/provider.dart';
import '../../Providers/ImageProvider.dart';
import '../../controller/registerCustomerAPI.dart';
import '../MyWidgite/ChoiseImage.dart';
import '../MyWidgite/buttons.dart';
import '../MyWidgite/textField.dart';


class customerRegister extends StatefulWidget {
  const customerRegister({super.key});
  @override
  State<customerRegister> createState() => _customerRegisterState();
}

class _customerRegisterState extends State<customerRegister> {
  TextEditingController name = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // ignore: no_leading_underscores_for_local_identifiers
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await choisimage(context);
                  },
                  child: Consumer<Imageprovider>(
  builder: (context, Prov, child) {
  return CircleAvatar(
                minRadius: 125,
                backgroundColor: Color.fromARGB(255, 76, 77, 220),
                backgroundImage:Prov.image != null ? Image.file(File(Prov.image!.path),fit: BoxFit.cover,).image : null,
                    child:Prov.image == null ?
                       Text("Your Profile Image".tr , style: TextStyle(color: Colors.white),):
                        Text("")
                  );
  },
),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Center(
                    child:
                        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                        padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                        child:
                            textFieldCustom(controler: name, labelText: "Your Name".tr),
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                        child: textFieldCustom(
                            controler: confirmpassword,
                            labelText: "Confirm Password".tr),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MaterialButtonCustom(
                        materialtext: 'Create Account'.tr,
                        onpressed: () async {
                          if(name.text.isNotEmpty && username.text.trim().isNotEmpty && password.text.isNotEmpty){
                           String userName = username.text.trim();
                           if(password.text == confirmpassword.text){
                             await CreateAccount(context).createAccount(name.text,userName,password.text,Provider.of<Imageprovider>(context , listen: false).image!);
                           } else{
                             showSnackBar(context, "Your Repassword Is Not True", Colors.redAccent, false);
                           }
                          }
                          else{
                            showSnackBar(context, "Not Allow Null Value", Colors.redAccent, false);
                          }                          },
                        color: const Color.fromARGB(255, 76, 77, 220),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
