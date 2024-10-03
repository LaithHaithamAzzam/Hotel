
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/LogoutAPI.dart';
import 'package:hotel/locale/local_controller.dart';
import 'package:hotel/main.dart';
import 'package:hotel/view/AdminScreen/AddAdmin.dart';
import 'package:hotel/view/AdminScreen/AddLocation.dart';
import 'package:hotel/view/AdminScreen/ChargeWallet.dart';
import 'package:hotel/view/HotelScreen/HotelRegister.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SplashScreen/LoginAndRegister.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    localeController lc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Screen".tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50,
                      60))),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddLocation(),));
                  }, child: Text("Add Location".tr , style: TextStyle(color: Colors.white),)),
            ),


            TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50,
                    60))),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelRegister(),));
                }, child: Text("Add Hotel".tr , style: TextStyle(color: Colors.white),)),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50,
                      60))),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAdmin(),));
                  }, child: Text("Add Admin".tr , style: TextStyle(color: Colors.white),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50,
                      60))),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChargeWall(),));
                  }, child: Text("Charge Wallet".tr , style: TextStyle(color: Colors.white),)),
            ) ,
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50,
                      60))),
                  onPressed: (){
                    if (lang!.getString("lang") == null) {
                      String x = Get.deviceLocale.toString();
                      lang!.setString("lang", x);

                      print(Get.deviceLocale);
                    }
                    if (lang!.getString("lang") == "ar_SY") {
                      lc.changelang("en_US");
                      print("english");
                    } else if (lang!.getString("lang") == "en_US") {
                      lc.changelang("ar_SY");
                      print("arabic");
                    }
                   }, child: Text("Language".tr , style: TextStyle(color: Colors.white),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50,
                      60))),
                  onPressed: ()async{
                    Logout(context).logout();
                    }, child: Text("Logout".tr , style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
