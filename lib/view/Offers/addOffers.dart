import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/Offers/selectdate.dart';

import 'TextFieldCustom.dart';
import 'dropdown.dart';


class addOffersBottomsheet extends StatelessWidget {
  addOffersBottomsheet({super.key});
  TextEditingController controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: DropdownMenuBottomoffers(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextButton(
                        onPressed: () {
                          Selectdate(context, 180000);
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
                                    side: BorderSide(color: Colors.white)))),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 27, right: 27),
                        child: textFieldCustom(
                            controler: controler, labelText: "offer Price")),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                      child: TextButton(
                        onPressed: () {},
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
      ),
    );
  }
}
