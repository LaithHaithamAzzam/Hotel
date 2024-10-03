import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/searchAPI.dart';
import 'package:hotel/view/HomeScreen/HotelsSerch.dart';
import 'package:hotel/view/HotelScreen/Detail_Hotel_User.dart';
import 'package:hotel/view/HotelScreen/HotelDateils.dart';
import 'package:hotel/view/MyWidgite/SnackBar.dart';
import 'package:hotel/view/MyWidgite/textField.dart';
import '../Wallet/SelectedPay.dart';
import 'DropDownlist_Rooms.dart';

TextEditingController price = TextEditingController();
TextEditingController country = TextEditingController();
TextEditingController city = TextEditingController();

class SerchBottom extends StatelessWidget {
  SerchBottom({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.only(left: 8.0, right: 8.0),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      actions: [
        Container(
            decoration: BoxDecoration(
                color: Color(0xff4C4DDC),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Coustom Serch".tr,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Textfromfild(
                      suffixicon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "SP".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      prefixicon: Icon(
                        Icons.price_change_outlined,
                        color: Colors.white,
                      ),
                      controllertxt: price,
                      hinttext: 'Set price'.tr,
                      txtInputType: TextInputType.phone,
                    ),
                    Textfromfild(
                      suffixicon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      prefixicon: Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      controllertxt: country,
                      hinttext: 'Country'.tr,
                      txtInputType: TextInputType.streetAddress,
                    ),
                    Textfromfild(
                      suffixicon:Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      prefixicon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      controllertxt: city,
                      hinttext: 'City'.tr,
                      txtInputType: TextInputType.streetAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextButton(
                        onPressed: () async {
                          await SearchAPI(context).searchcustom(country.text, city.text,price.text.isEmpty ? 0 : int.parse(price.text));
                          },
                        child: Text("Search Hotel".tr),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff3D36A4)),
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 60)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))))),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
