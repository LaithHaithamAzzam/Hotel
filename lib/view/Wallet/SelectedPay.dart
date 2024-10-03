import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/DateProvider.dart';
import 'package:hotel/Providers/MyWallet_Provider.dart';
import 'package:hotel/Providers/SelectRoomsProvider.dart';
import 'package:hotel/controller/Booking.dart';
import 'package:hotel/view/HotelScreen/DoneBooking.dart';
import 'package:provider/provider.dart';
import '../../Providers/NotificationProvider.dart';
import '../HomeScreen/Notification.dart';
import '../MyWidgite/SnackBar.dart';

class SelectPay extends StatelessWidget {
  const SelectPay({super.key});

  @override
  Widget build(BuildContext context) {
    int selectiongrp =  0 ;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0,left: 5.0 , right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Total" , style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("${Provider.of<DateProvider>(context , listen: false).sallary} SP" , style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            TextButton(
              onPressed: ()async{
                await BookingAPI(context).Booking(Provider.of<DateProvider>(context , listen: false).StartDate, Provider.of<DateProvider>(context , listen: false).EndDate, Provider.of<SelectRoomsProvider>(context,listen: false).roomid!, Provider.of<DateProvider>(context , listen: false).sallary);
                },
              child: Text("Booking Now".tr),
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor:MaterialStatePropertyAll(Color(0xff4C4DDC)),
                  minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-10 , 60)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Booking Hotel".tr),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
          margin: EdgeInsets.all(25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: RadioListTile(
                  secondary: Icon(Icons.wallet,color: Color(0xff5852B1),size: 25),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)),side: BorderSide(color: Color(0xff4C4DDC))),
                  title: Center(child: Text("Hotel Wallet".tr)),
                  value: 0,
                  activeColor: Color(0xff5852B1),
                  groupValue: selectiongrp,
                  onChanged: (int? value) {
                  },
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: RadioListTile(
                  secondary: Icon(Icons.paypal,color: Color(0xff5852B1),size: 25),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)),side: BorderSide(color: Color(0xff4C4DDC))),
                  title: Center(child: Text("PayPal")),
                  value: 1,
                  activeColor: Color(0xff5852B1),
                  groupValue: selectiongrp,
                  onChanged: (int? value) {
                  },
                              ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: RadioListTile(
                  secondary: Icon(Icons.apple,color: Color(0xff5852B1),size: 25),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)),side: BorderSide(color: Color(0xff4C4DDC))),
                  title: Center(child: Text("Apple Pay")),
                  value: 2,
                  activeColor: Color(0xff5852B1),
                  groupValue: selectiongrp,
                  onChanged: (int? value) {
                  },
                              ),
                ),
                RadioListTile(
                secondary: Icon(Icons.payments_outlined,color: Color(0xff5852B1),size: 25),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)),side: BorderSide(color: Color(0xff4C4DDC))),
                title: Center(child: Text("Syriatel Cash")),
                value: 3,
                activeColor: Color(0xff5852B1),
                groupValue: selectiongrp,
                onChanged: (int? value) {
                },
                            ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
