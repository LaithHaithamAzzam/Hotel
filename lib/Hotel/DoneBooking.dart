import 'package:flutter/material.dart';
import 'package:hotel/HomeScreen/MainHomeScreen.dart';
import 'package:hotel/Hotel/Detail_Hotel_User.dart';
import 'package:hotel/Wallet/MyWallet.dart';

import '../HomeScreen/Notification.dart';
import '../MyWidgite/SnackBar.dart';

class DoneBooking extends StatefulWidget {
  const DoneBooking({super.key});

  @override
  State<DoneBooking> createState() => _DoneBookingState();
}

class _DoneBookingState extends State<DoneBooking> {
@override

  Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),),(route) => false,);
          return Future(() => false);
        },
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeScreen(),), (
                        route) => false,);
                  },
                  child: Text("OK"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(
                          Color(0xff4C4DDC)),
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery
                          .of(context)
                          .size
                          .width - 40, 60)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))))
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Mywallet(),), (
                        route) => false,);
                  },
                  child: Text("Show My Wallet"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(
                          Color(0xff4C4DDC)),
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery
                          .of(context)
                          .size
                          .width - 40, 60)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))))
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: GestureDetector(
                        onTap: ()async {
                          await not();
                        },
                        child: Icon(Icons.check_circle, color: Color(0xff5852B1),
                          size: MediaQuery
                              .of(context)
                              .size
                              .width / 2,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("Order Confirmed", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5852B1)),),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.5,
                      height: MediaQuery
                          .of(context)
                          .size
                          .width / 3,

                      alignment: Alignment.topCenter,
                      child: Text(
                        "Your Room \n 25 - 26 - 27 - 28 -25 - 26 - 27 - 28 25 - 26 - 27 - 28",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Color(0xff5852B1)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: Text(textAlign: TextAlign.center,
                        "thank you for your order. \n check your Notification to show Your Room",
                        style: TextStyle(fontWeight: FontWeight.bold,
                            color: Color(0xff5852B1)),),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
