import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/MyWidgite/textField.dart';

class HotelSettings extends StatefulWidget {
  const HotelSettings({super.key});

  @override
  State<HotelSettings> createState() => _HotelSettingsState();
}

class _HotelSettingsState extends State<HotelSettings> {
  TextEditingController location = TextEditingController();
  TextEditingController minimumPrice = TextEditingController();
  TextEditingController service = TextEditingController();
  TextEditingController roomcounter = TextEditingController();
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
              "https://th.bing.com/th/id/R.b1ec5bc05f529d4a6c1696b21a515450?rik=7sBupPNAA9ptnw&pid=ImgRaw&r=0",
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
          child: textFieldCustom(controler: location, labelText: "Location".tr),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
          child: textFieldCustom(
              controler: roomcounter, labelText: "Number of Rooms".tr),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: _w * 0.08, right: _w * 0.08),
          child: textFieldCustom(
              controler: minimumPrice, labelText: "Minimum Price".tr),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
          child: textFieldCustom(controler: service, labelText: "Services".tr),
        ),
        const SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}
