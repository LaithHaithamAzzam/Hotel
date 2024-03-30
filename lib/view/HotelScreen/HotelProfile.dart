import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/api.dart';
import 'package:hotel/locale/local_controller.dart';
import 'package:hotel/main.dart';
import 'package:hotel/view/HotelScreen/HotelSettings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Providers/customerInformationProvider.dart';
import '../MyWidgite/buttons.dart';
import '../SplashScreen/LoginAndRegister.dart';

class HotelProfile extends StatefulWidget {
  const HotelProfile({super.key});

  @override
  State<HotelProfile> createState() => _HotelProfileState();
}

class _HotelProfileState extends State<HotelProfile> {
  localeController lc = Get.find();

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            //from api
            Text("Hotel Name"),
            IconButton(onPressed: () {}, icon: Icon(Icons.doorbell_outlined))
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: _w * 0.08),
          height: _h * 0.35,
          width: _w * 0.8,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 76, 77, 220),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Image.network(
            "$SERVER""$Showimage/${ Provider.of<customerInformationProvider>(context , listen:  false).imageid}"
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(right: _w * 0.1, left: _w * 0.1),
          child: MaterialButtonCustom(
            materialtext: "Hotel Settings".tr,
            onpressed: () {
              Get.to(() => const HotelSettings());
            },
            color: const Color.fromARGB(255, 76, 77, 220),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(right: _w * 0.1, left: _w * 0.1),
          child: MaterialButtonCustom(
            materialtext: "Language".tr,
            onpressed: () {
              if (lang!.getString("lang") == null) {
                String x = Get.deviceLocale.toString();
                lang!.setString("lang", x);
                print(Get.deviceLocale);
              }
              if (lang!.getString("lang") == "ar") {
                lc.changelang("en");
                print("english");
              } else if (lang!.getString("lang") == "en") {
                lc.changelang("ar");
                print("arabic");
              }
            },
            color: const Color.fromARGB(255, 76, 77, 220),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(right: _w * 0.1, left: _w * 0.1),
          child: MaterialButtonCustom(
            materialtext: "Sign Out".tr,
            onpressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => loginAndRegisterScreen(),));
            },
            color: const Color.fromARGB(255, 228, 121, 121),
          ),
        ),
      ]),
    );
  }
}
