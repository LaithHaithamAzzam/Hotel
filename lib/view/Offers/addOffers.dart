import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/SelectRoomsOfferProvider.dart';
import 'package:hotel/controller/AddOfferAPI.dart';
import 'package:hotel/view/MyWidgite/TextButtonForHotel.dart';
import 'package:hotel/view/Offers/roomcounter.dart';
import 'package:hotel/view/Offers/selectdate.dart';
import 'package:provider/provider.dart';


TextEditingController controler = TextEditingController();
class addOffersBottomsheet extends StatelessWidget {
  addOffersBottomsheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color(0xff4C4DDC),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 10.0),
              child: Text(
                "Add Offer".tr,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 27, right: 27),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  controller: controler,
                  onFieldSubmitted: (val){
                    val = min(99.0, double.parse((val).toString())).toString();
                    val = max(2.0, double.parse((val).toString())).toString();
                    controler.text = val;
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 76, 77, 220),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1, color: Colors.white)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1, color: Colors.white)),
                      labelText: "Offer Discount",
                      labelStyle: const TextStyle(color: Colors.white60 ,)),
                )),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     Padding(
                      padding:  EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextButtonforHotel(color: Color(0xff3D36A4),width:MediaQuery.of(context).size.width - 50 ,hight: 60
                        ,text:"Select Rooms" ,onpressed: (){
                         showDialog(context: context, builder: (context) => Roomcounteroffers(),);
                        },),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextButton(
                        onPressed: () {
                          Selectdate(context);
                        },
                        child: Text(
                          "Select Date".tr,
                          //${Provider.of<DateProvider>(context , listen: false).Dateis}
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff3D36A4)),
                            minimumSize: MaterialStatePropertyAll(
                                Size(MediaQuery.of(context).size.width - 50, 60)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                 ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                      child: TextButton(
                        onPressed: ()async {
                          controler.text = min(99.0, double.parse((controler.text).toString())).toString();
                          controler.text = max(2.0, double.parse((controler.text).toString())).toString();
                         await AddOfferAPI(context).addOffer(
                              double.parse(controler.text),
                              Provider.of<SelectRoomsOfferProvider>(context , listen: false).Rooms!,
                              Provider.of<SelectRoomsOfferProvider>(context , listen: false).Startdate.toString(),
                              Provider.of<SelectRoomsOfferProvider>(context , listen: false).Enddate.toString());
                         controler.clear();
                          },
                        style: ButtonStyle(
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                const MaterialStatePropertyAll(Color(0xff3D36A4)),
                            minimumSize: MaterialStatePropertyAll(
                                Size(MediaQuery.of(context).size.width - 10, 60)),
                            shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))))),
                        child:  Text("Add Offer".tr),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
