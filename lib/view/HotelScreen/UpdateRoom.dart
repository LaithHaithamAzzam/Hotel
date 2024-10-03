import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/RoomDertailProvider.dart';
import 'package:hotel/Providers/SelectionDropDownList.dart';
import 'package:hotel/controller/UpdateRoomDetails.dart';
import 'package:hotel/view/MyWidgite/Show_Room_date.dart';
import 'package:hotel/view/MyWidgite/TextButtonForHotel.dart';
import 'package:hotel/view/MyWidgite/dropdown.dart';
import 'package:provider/provider.dart';

import '../MyWidgite/DropDownlist_Rooms.dart';
import '../MyWidgite/textField.dart';

class UpdateRoom extends StatefulWidget {
  UpdateRoom({ this.roomid , required this.Tex ,super.key});
  int? roomid;
  String? Tex;
  @override
  State<UpdateRoom> createState() => _UpdateRoomState();
}

class _UpdateRoomState extends State<UpdateRoom> {
  TextEditingController txt = TextEditingController();
  @override
  void initState() {
    txt.text=widget.Tex!;
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Provider.of<SelectionDropDownList>(context , listen: false).SetValue('${( Provider.of<RoomDertailProvider>(context , listen: false).roomDetail!.type).toString()}');
    return Scaffold(
      appBar: AppBar(
        title: Text("Room".tr+ "${ Provider.of<RoomDertailProvider>(context , listen: false).roomDetail!.roomNumber}" , style: TextStyle(color: Colors.black),),
        centerTitle: true,
        foregroundColor: Color(0xff3D36A4),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              width: width - 50,
              decoration:BoxDecoration(
                  border: Border.all(color: Color(0xff3D36A4)),
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: dropdowncutom(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TextButtonforHotel(onpressed: (){
                Provider.of<RoomDertailProvider>(context , listen: false).bookings!.isNotEmpty ?  showDialog(context: context, builder: (context) => Roomdate(context)) : null;
              },
                  hight: 60,
                  color: Color(0xff3D36A4),
                  text: Provider.of<RoomDertailProvider>(context , listen: false).bookings!.isEmpty ?
                  "Is Not Booking".tr
                      :"Is Booking".tr +" , " +"Click To Show Date".tr
                  , width: width-50),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: CoustoumTextfield(controler: txt ,labelText: "Price".tr, width: width-50,enable: true,type: TextInputType.number),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TextButtonforHotel(onpressed: () async {
                await UpdateRoomDetails(context).updateRoomDetails(
                    widget.roomid!,
                    ( Provider.of<SelectionDropDownList>(context , listen: false).item).toString(),
                    double.parse((txt.text).toString())
                );
              },
                  hight: 60,
                  color: Color(0xff3D36A4),
                  text: "Save Editing".tr
                  , width: width-50),
            ),
          ],
        ),
      ),
    );
  }
}



