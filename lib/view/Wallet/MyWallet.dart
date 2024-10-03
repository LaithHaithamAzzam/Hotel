import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/BottombarProvider.dart';
import 'package:hotel/controller/GetWallet.dart';
import 'package:hotel/view/HomeScreen/MainHomeScreen.dart';
import 'package:provider/provider.dart';

import '../../Providers/MyWallet_Provider.dart';
import '../../Providers/customerInformationProvider.dart';

class Mywallet extends StatelessWidget {




   Mywallet({super.key});
  @override
  TextEditingController monyContr = TextEditingController(text: "50000");
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
       if(Provider.of<BBProvider>(context , listen: false).currentIndex==3){
         Provider.of<BBProvider>(context , listen: false).setcurrentindex(0);
       }else{
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
       }
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          title: Text("My Wallet".tr , style: TextStyle(fontSize: 16),),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15.0 , right: 15.0 , top: 5),
            child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.only(bottom: 38.0 , top: 19.0),
                 child: Stack(
                   alignment: Alignment.center,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.white),
                         borderRadius: BorderRadius.all(Radius.circular(22)),
                         boxShadow: [
                           BoxShadow(
                               color: Colors.black54,
                               blurStyle: BlurStyle.solid,
                               spreadRadius: 0,
                               offset: Offset(0, 0)
                               ,blurRadius: 5
                           ),
                         ],
                       ),
                       child: SvgPicture.asset("images/wallet.svg" , width: 350,),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 30.0),
                       child: Align(
                           alignment: Alignment(-0.8, 0),
                           child: Text("${( Provider.of<customerInformationProvider>(context,listen: true).name).toUpperCase()}" , style: TextStyle(color: Colors.white , fontSize: MediaQuery.of(context).size.width * 0.037),)),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 0.0),
                       child: Align(
                           alignment: Alignment(0.8, 6),
                           heightFactor: 2,
                           child: Text("${Provider.of<WalletProvider>(context, listen: true).mony} SP" , style: TextStyle(color: Colors.white , fontSize: MediaQuery.of(context).size.width * 0.037),))
                     ),
                   ],
                 ),
               ),
                IconButton(onPressed: ()async{
                  await GetWallet(context).getWallet();
                }, icon: Icon(Icons.refresh_sharp , color: Color.fromARGB(255, 76, 77, 220),size: 40,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


