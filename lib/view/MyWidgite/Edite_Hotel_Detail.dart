import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/HotelRoomsProvider.dart';
import 'package:hotel/Providers/RoomDertailProvider.dart';
import 'package:hotel/controller/UpdateDetails.dart';
import 'package:hotel/view/MyWidgite/TextButtonForHotel.dart';
import 'package:hotel/view/MyWidgite/textField.dart';
import 'package:provider/provider.dart';

  detail(BuildContext context , String det) {
    TextEditingController detailcon = TextEditingController();
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      alignment: Alignment.center,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: AlertDialog(
            insetPadding: EdgeInsets.all(9.0),
            actions:[ Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)
              ),
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .width - 50,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0),
                        child: CoustoumTextfield(controler: detailcon, labelText: '$det', enable: true, width: MediaQuery.of(context).size.width-50,type: TextInputType.text),
                      ),
                      TextButtonforHotel(onpressed: () async {
                        detailcon.text.isNotEmpty ? await UpdateDetails(context).updateDetails(detailcon.text):null;
                      },
                        width: MediaQuery.of(context).size.width-50,
                        hight: 60,
                        text: "Update Detail".tr ,
                        color: Color(0xff4C4DDC),
                      )
                    ],
                  )
              ),
            ),
            ]
        ),
      ),
    );
  }