import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/view/HotelScreen/Detail_Hotel_User.dart';
import 'package:hotel/view/HotelScreen/HotelDateils.dart';
import 'package:hotel/view/MyWidgite/textField.dart';
import '../Wallet/SelectedPay.dart';
import 'DropDownlist_Rooms.dart';

TextEditingController price = TextEditingController();
TextEditingController location = TextEditingController();

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
                            "Coustom Serch",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Textfromfild(
                      suffixicon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "SP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      prefixicon: Icon(
                        Icons.price_change_outlined,
                        color: Colors.white,
                      ),
                      controllertxt: price,
                      hinttext: 'Set price',
                      txtInputType: TextInputType.phone,
                    ),
                    Textfromfild(
                      suffixicon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "SP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      prefixicon: Icon(
                        Icons.price_change_outlined,
                        color: Colors.white,
                      ),
                      controllertxt: price,
                      hinttext: 'Set price',
                      txtInputType: TextInputType.phone,
                    ),
                    Textfromfild(
                      suffixicon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      prefixicon: Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                      ),
                      controllertxt: location,
                      hinttext: 'Location',
                      txtInputType: TextInputType.streetAddress,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detile_Hotel(),));
                        },
                        child: Text("Serch Hotel"),
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
