import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/DarwerProvider.dart';
import 'package:hotel/Providers/HotelRoomsProvider.dart';
import 'package:hotel/controller/AddPrivImage_Void.dart';
import 'package:hotel/controller/AllMyOffers.dart';
import 'package:hotel/controller/LogoutAPI.dart';
import 'package:hotel/locale/local_controller.dart';
import 'package:hotel/main.dart';
import 'package:hotel/view/MyWidgite/Edite_Hotel_Location_Detail.dart';
import 'package:hotel/view/MyWidgite/HotelBottomSheetRooms.dart';
import 'package:hotel/view/MyWidgite/Edite_Hotel_Detail.dart';
import 'package:hotel/view/MyWidgite/TextButtonForHotel.dart';
import 'package:hotel/view/SplashScreen/LoginAndRegister.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DraweHome extends StatefulWidget {
  const DraweHome({super.key});

  @override
  State<DraweHome> createState() => _DraweHomeState();
}

class _DraweHomeState extends State<DraweHome> {
  @override
  Widget build(BuildContext context) {
    localeController lc = Get.find();
    return GestureDetector(
      onTap: (){
        Provider.of<DraweProvider>(context , listen: false).opendrawer(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xff4C4DDC) ,
          centerTitle: true,
          title: Text("Burj Alreem Hotel" , style: TextStyle(color: Colors.white , fontSize: 18),),
        ),
        backgroundColor: Color(0xff4C4DDC),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: TextButtonforHotel(color: Color(0xff3D36A4),text: "My Rooms".tr,width: MediaQuery.of(context).size.width/3,hight:60,onpressed: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => HotelBottomSheetRooms(),
                        );
                      }, )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextButtonforHotel(color: Color(0xff3D36A4),text: "My Offers".tr,width: MediaQuery.of(context).size.width/3,hight:60,onpressed: (){
                          AllMyOffers(context).allMyOffers(false);
                          }, )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextButtonforHotel(color: Color(0xff3D36A4),text: "Edite Detail".tr,width: MediaQuery.of(context).size.width/3,hight:60,onpressed: (){
                        showDialog(context: context, builder: (context) =>   detail(context ,"${Provider.of<HotelRoomsProvider>(context , listen: false).detail}" ),);
                          }, ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextButtonforHotel(color: Color(0xff3D36A4),text: "Edite Location Detail".tr,width: MediaQuery.of(context).size.width/3,hight:60,onpressed: (){
                          showDialog(context: context, builder: (context) =>   detailLocation(context ,"${Provider.of<HotelRoomsProvider>(context , listen: false).locationDetail}" ),);

                        }, ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextButtonforHotel(color: Color(0xff3D36A4),text: "Add Preview Image".tr,width: MediaQuery.of(context).size.width/3,hight:60,onpressed: (){
                          Addimage(context);
                        }, ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                        child:
                        TextButtonforHotel(color: Color(0xff3D36A4),text: "Language".tr,width: MediaQuery.of(context).size.width/3,hight:60,onpressed: (){
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
                        }, ),
                      ),
                      TextButtonforHotel(color: Colors.redAccent,text: "Logout".tr,width: MediaQuery.of(context).size.width/3,hight:60,onpressed: ()async{
                        Logout(context).logout();
                        }, ),
                    ],
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
