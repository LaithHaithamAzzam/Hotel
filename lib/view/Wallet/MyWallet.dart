import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/BottombarProvider.dart';
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
               ) ,
            Text("You Can Charge Your Wallet".tr , style: TextStyle(color: Color(0xff4C4DDC) , fontSize: MediaQuery.of(context).size.width * 0.037),),
        Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 50,
                    margin: EdgeInsets.only(top: 5),
                    decoration:BoxDecoration(
                          border: Border.all(color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurStyle: BlurStyle.solid,
                                spreadRadius: 0,
                                offset: Offset(0, 0)
                                ,blurRadius: 5
                            ),
                          ],
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: Color(0xffF1F1FA)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text("Charging My Wallet".tr),
                            Text("Mony".tr),
                            TextFormField(
                                maxLength: 10,
                              controller: monyContr,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false),
                              decoration: InputDecoration(border: InputBorder.none,
                                  counterText: ''
                              ),
                              style: TextStyle(color: Color(0xff3D36A4),fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: (){
                                if(monyContr.text.isNotEmpty){
                                  Provider.of<WalletProvider>(context , listen: false).ChargeWallet(double.parse(monyContr.text));
                                }
                              },
                              child: Text("Charging Now".tr),
                              style: ButtonStyle(
                                shadowColor: MaterialStatePropertyAll(Colors.black),
                                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                                  backgroundColor:MaterialStatePropertyAll(Color(0xff4C4DDC)),
                                  minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * .9 , 60)),
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
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


