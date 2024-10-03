import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/BottombarProvider.dart';
import 'package:hotel/Providers/customerInformationProvider.dart';
import 'package:hotel/controller/LogoutAPI.dart';
import 'package:hotel/controller/api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../locale/local_controller.dart';
import '../../main.dart';
import '../HomeScreen/MainHomeScreen.dart';
import '../SplashScreen/LoginAndRegister.dart';



class MyProf extends StatefulWidget {
  const MyProf({super.key});

  @override
  State<MyProf> createState() => _MyProfState();
}

class _MyProfState extends State<MyProf> {

  @override
  Widget build(BuildContext context) {
    localeController lc = Get.find();
    print(lc.init);

    return WillPopScope(
      onWillPop: () {
        if(Provider.of<BBProvider>(context , listen: false).currentIndex==2){
          Provider.of<BBProvider>(context , listen: false).setcurrentindex(0);
        }else{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
        }
        return Future(() => false);
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width:  MediaQuery.of(context).size.width - 30,
                  height:  MediaQuery.of(context).size.width * .50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(image: NetworkImage(
                          "$SERVER""$Showimage/${ Provider.of<customerInformationProvider>(context , listen:  false).imageid}"
                      ),fit: BoxFit.cover,)
                  ),
                ),
               Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 20.0),
                     child: Text("My Profile".tr , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 14),),
                   )
                   ,
                   Container(
                     margin: EdgeInsets.all(7.0),
                     width: MediaQuery.of(context).size.width - 40,
                     decoration: BoxDecoration(
                         color: Color(0xff4C4DDC)
                         ,borderRadius: BorderRadius.all(Radius.circular(6))
                     ),
                     child: TextFormField(
                       textAlign: TextAlign.center,
                       initialValue: Provider.of<customerInformationProvider>(context,listen: true).name,
                       style: TextStyle(color: Colors.white),
                       decoration: InputDecoration(
                           border: OutlineInputBorder(borderSide: BorderSide.none),
                           enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)
                       ),
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.all(7.0),
                     width: MediaQuery.of(context).size.width - 40,
                     decoration: BoxDecoration(
                         color: Color(0xff4C4DDC)
                         ,borderRadius: BorderRadius.all(Radius.circular(6))
                     ),
                     child: TextFormField(
                       textAlign: TextAlign.center,
                       initialValue: Provider.of<customerInformationProvider>(context,listen: true).username,
                       style: TextStyle(color: Colors.white),
                       decoration: InputDecoration(
                           border: OutlineInputBorder(borderSide: BorderSide.none),
                           enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)
                       ),
                     ),
                   ),

                   Text("Settings".tr , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 14),)
                   ,Padding(
                     padding: const EdgeInsets.only(top: 10.0 , bottom: 10.0),
                     child: TextButton(
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
                       },
                       child: Text('Language'.tr),
                       style: ButtonStyle(
                           foregroundColor: MaterialStatePropertyAll(Colors.white),
                           backgroundColor:MaterialStatePropertyAll(Color(0xff4C4DDC)),
                           minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * .9 , 60)),
                           shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                       ),
                     ),
                   ),

                   TextButton(
                     onPressed: ()async{
                       Logout(context).logout();
                       },
                     child: Text("Logout".tr),
                     style: ButtonStyle(
                       overlayColor: MaterialStatePropertyAll(Color(0xffe57b7b)),
                         foregroundColor: MaterialStatePropertyAll(Colors.white),
                         backgroundColor:MaterialStatePropertyAll(Color(0xffE26A6A)),
                         minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * .9 , 60)),
                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                     ),
                   ),
                 ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
