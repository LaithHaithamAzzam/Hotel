import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/ChargeWallet.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';

class ChargeWall extends StatelessWidget {
   ChargeWall({super.key});
   TextEditingController username = TextEditingController();
   TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Charge Wallet".tr),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  hintText: "Username".tr,suffixIcon: Icon(Icons.supervised_user_circle_sharp,color:  Color.fromARGB(255, 76, 77, 220),)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0 , bottom: 28.0),
                child: TextFormField(
                  controller: amount,
                  decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ) ,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      hintText: "Amount".tr,suffixIcon: Icon(Icons.monetization_on,color:  Color.fromARGB(255, 76, 77, 220),)
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-20,60)),
                  backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 76, 77, 220)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                ),
                  onPressed: ()async{
                        if(username.text.trim().isNotEmpty && amount.text.trim().isNotEmpty){
                       if( double.parse(amount.text) > 0.0){
                         await ChargeWallet(context).chargeWallet(username.text, amount.text);
                         amount.clear();
                         username.clear();
                       }
                       else{
                         showSnackBar(context, "Amount Must be Positive", Colors.redAccent, false);

                       }
                        }else{
                          showSnackBar(context, "Not Allow Null Value", Colors.redAccent, false);
                        }

                  }, child: Text("Charge Wallet".tr,style: TextStyle(color:Colors.white,)))
            ],
          ),
        ),
      ),
    );
  }
}
