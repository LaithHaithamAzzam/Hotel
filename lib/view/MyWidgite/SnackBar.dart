import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Icons/my_hoteli_icons.dart';
import 'package:hotel/Providers/MyWallet_Provider.dart';

import 'package:provider/provider.dart';



showSnackBar(BuildContext context , String Title , Color color , bool done){
  SnackBar cSnack = SnackBar(
      padding: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: color,
      closeIconColor: Colors.white,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.5 ,
          left: 10.0,
          right: 10.0
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                done ? Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(MyHoteli.notifications,color: Colors.white,),
                ) : Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Icon(Icons.error_outline_outlined,color: Colors.white,),
                ),
                Text("$Title")
              ],
            ) ,
            done ?
            GestureDetector(
                onTap: (){
                  Provider.of<WalletProvider>(context,listen: false).ChargeWallet(180000);
                },
                child: Text("Charge Now".tr , style: TextStyle(color: Colors.green),)
            ):
            Text("")
          ],),
      )
  );
  ScaffoldMessenger.of(context).showSnackBar(cSnack);
}



Showsnack(BuildContext context , String DoneTitle , String ErrorTitle , Color errorcolor ,Color donecolor , bool done){
  SnackBar cSnack = SnackBar(
      padding: EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 5),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: done ? donecolor :errorcolor ,
      closeIconColor: Colors.white,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.3 ,
          left: 10.0,
          right: 10.0
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                done ? Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.check_circle,color: Colors.white,),
                ) : Icon(Icons.error_outline_outlined,color: Colors.white,),
                done ?  Text("$DoneTitle") : Text("$ErrorTitle")
              ],
            ) ,
          ],),
      )
  );
  ScaffoldMessenger.of(context).showSnackBar(cSnack);
}