import 'package:flutter/material.dart';
import 'package:hotel/Wallet/MyWallet.dart';
import 'package:provider/provider.dart';

import '../Providers/MyWallet_Provider.dart';


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
                child: Icon(Icons.notifications_active,color: Colors.white,),
              ) : Icon(Icons.error_outline_outlined,color: Colors.white,),
              Text("$Title")
            ],
          ) ,
            done ?
            GestureDetector(
                onTap: (){
                  Provider.of<WalletProvider>(context,listen: false).ChargeWallet(180000);
                },
                child: Text("Charge Now" , style: TextStyle(color: Colors.green),)
            ):
            Text("")
        ],),
      )
  );
  ScaffoldMessenger.of(context).showSnackBar(cSnack);
}