import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/RoomDetailAPI.dart';
import 'package:hotel/view/HotelScreen/UpdateRoom.dart';
import 'package:provider/provider.dart';

import '../../Providers/HotelHomeScreen_Provider.dart';
class HotelBottomSheetRooms extends StatelessWidget {
  const HotelBottomSheetRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff3D36A4),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff3D36A4),
        ),
        margin: EdgeInsets.all(10),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0 ),
              child: Text("All My Rooms".tr , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white),),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, mainAxisSpacing: 10, crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: ()async {
                      await RoomDetailAPI(context).roomDetailAPI(int.parse((Provider.of<HotelHomeScreenProvider>(context , listen: false).rooms?.elementAt(index).id).toString()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Provider.of<HotelHomeScreenProvider>(context , listen: false).rooms?.elementAt(index).isBooked == false ? Color(0xff3D36A4) :  Color(0xff4C4DDC),
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Text("${Provider.of<HotelHomeScreenProvider>(context , listen: false).rooms?.elementAt(index).roomNumber}",style: TextStyle(color: Colors.white),),
                    ),
                  );
                },
                itemCount:  Provider.of<HotelHomeScreenProvider>(context , listen: false).roomCount),
              ),
            ),
          ],
        ),
      )
    );
  }
}
