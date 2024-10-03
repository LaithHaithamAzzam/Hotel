import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/SelectRoomsProvider.dart';
import 'package:hotel/controller/RoomTotal.dart';
import 'package:hotel/view/MyWidgite/RoomCounter.dart';
import 'package:hotel/view/MyWidgite/showDateSelected.dart';
import 'package:provider/provider.dart';
import '../../Providers/DateProvider.dart';
import '../../Providers/HotelRoomsProvider.dart';
import '../../Providers/roomTypesProvider.dart';
import '../../controller/roomTypeCounterAPI.dart';
import '../Wallet/SelectedPay.dart';
import 'DropDownlist_Rooms.dart';
class Bottomsheet extends StatelessWidget {
  const Bottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff4C4DDC),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0 , bottom: 10.0),
            child: Text("Room Type".tr , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 16),),
          ) ,
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 10.0 , bottom: 10.0),
                   child: DropdownMenuBottom(),
                 ),
                 Padding(
                   padding: const EdgeInsets.only( bottom: 10.0),
                   child: TextButton(
                     onPressed: (){
                       Selectdate(context,180000);
                     },
                     child: Text("${Provider.of<DateProvider>(context , listen: false).Dateis}"),
                     style: ButtonStyle(
                         foregroundColor: MaterialStatePropertyAll(Colors.white),
                         backgroundColor:MaterialStatePropertyAll(Color(0xff3D36A4)),
                         minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-50 , 60)),
                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)),side: BorderSide(color: Colors.white)))
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: ()async{
                     Provider.of<SelectRoomsProvider>(context,listen: false).Rooms!.clear();
                     Provider.of<SelectRoomsProvider>(context,listen: false).roomid!.clear();
                     await roomTypeCounterAPI(context).roomTypeCounter(int.parse((Provider.of<HotelRoomsProvider>(context,listen: false).userId).toString()) , Provider.of<RoomTypesProvider>(context,listen: false).value.toString());
                     showDialog(context: context, builder: (context) => Roomcounter(counterroom:int.parse((Provider.of<HotelRoomsProvider>(context , listen: false).roomCounts).toString())));
                   },
                   child: Container(
                       width: MediaQuery.of(context).size.width-50 ,
                       height: 60,
                       decoration: BoxDecoration(
                           color: Color(0xff3D36A4),
                           borderRadius: BorderRadius.all(Radius.circular(6)),
                           border: Border.all(color: Colors.white,width: 2)
                       ),
                       child:Center(child: Text("Select Rooms".tr , style: TextStyle(fontSize: 16,color: Colors.white),))
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 40.0,left: 20.0 , right: 20.0),
                   child: Hero(
                     tag: "BookBTN",
                     child: TextButton(
                        onPressed: ()async {
                       await RoomTotalAPI(context).RoomTotal(Provider.of<DateProvider>(context , listen: false).StartDate, Provider.of<DateProvider>(context , listen: false).EndDate, Provider.of<SelectRoomsProvider>(context,listen: false).roomid!);
                         },
                       child: Text("Booking Now".tr),
                       style: ButtonStyle(
                           foregroundColor: MaterialStatePropertyAll(Colors.white),
                           backgroundColor:MaterialStatePropertyAll(Color(0xff3D36A4)),
                           minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-10 , 60)),
                           shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                       ),
                     ),
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
