
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/AdminScreen/AddAdmin.dart';
import 'package:hotel/view/AdminScreen/AddLocation.dart';
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddLocation(),));
                  }, child: Text("Charge Wallet".tr , style: TextStyle(color: Colors.white),)),
            ) ,
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50,
                      60))),
                  onPressed: ()async{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginAndRegisterScreen(),));
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                  }, child: Text("Logout".tr , style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
