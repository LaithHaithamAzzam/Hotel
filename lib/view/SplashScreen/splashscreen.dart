import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel/view/AdminScreen/Admin.dart';
import 'package:hotel/view/HomeScreen/MainHomeScreen.dart';
import 'package:hotel/view/SplashScreen/LoginAndRegister.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Providers/customerInformationProvider.dart';
import '../../controller/AllHotelAPI.dart';
import '../HotelScreen/HotelProfile.dart';




class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  cheeckuser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Islogin  = await prefs.getString("Islogin");
    String? rool = await prefs.getString("rool");
    if(Islogin == "true"){
      String? Name = await prefs.getString("Name");
      String? username = await prefs.getString("username");
      String? imageid = await prefs.getString("imageid");
      String? token = await prefs.getString("Token");
      print(token);
      Provider.of<customerInformationProvider>(context , listen:  false).setUserInfo("${Name}", "${token}","${username}","$imageid");
      if(rool == "user"){
       await allHotelAPI(context).allHotel();
        new Timer(const Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
        });
      }else if(rool == "hotel"){
        new Timer(const Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HotelProfile(),));
        });
      }else if(rool == "admin"){
        String? Tool = await prefs.getString("Token");
        print(Tool);
        new Timer(const Duration(seconds: 4), () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminScreen(),));
        });
      }
    }
    else {
      new Timer(const Duration(seconds: 4), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => loginAndRegisterScreen(),));
      });
    }
  }
  initState() {
    super.initState();
    cheeckuser();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 80),
        child: Center(
          child: Column(
            children: [
              Text("HOTELI",style: TextStyle(color: Color(0xff3D36A4),fontSize: 24),),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage("images/logo.jpg"),
                          fit: BoxFit.fill
                        )
                      ),
                    ).animate(onPlay: (controller) => controller.repeat()).shimmer(delay: Duration(milliseconds: 500),duration: Duration(milliseconds: 500)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
