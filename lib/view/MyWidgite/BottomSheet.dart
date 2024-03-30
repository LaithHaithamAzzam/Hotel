import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/view/MyWidgite/RoomCounter.dart';
import 'package:hotel/view/MyWidgite/showDateSelected.dart';
import 'package:provider/provider.dart';
import '../../Providers/DateProvider.dart';
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
            child: Text("Room Type" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 16),),
          ) ,
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 10.0 , bottom: 10.0),
                   child: DropdownMenuBottom(),
                 ),
                 GestureDetector(
                   onTap: (){
                     showDialog(context: context, builder: (context) => Roomcounter(counterroom:500),);
                   },
                   child: Container(
                     width: MediaQuery.of(context).size.width-50 ,
                     height: 60,
                     decoration: BoxDecoration(
                       color: Color(0xff3D36A4),
                       borderRadius: BorderRadius.all(Radius.circular(6)),
                       border: Border.all(color: Colors.white,width: 2)
                     ),
                     child:Center(child: Text("Select Rooms" , style: TextStyle(fontSize: 16,color: Colors.white),))
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 10.0 , bottom: 10.0),
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

                 Padding(
                   padding: const EdgeInsets.only(top: 25.0 , bottom: 25.0),
                   child: Text("${Provider.of<DateProvider>(context , listen: false).sallary} /Night  SP",style:TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
                   child: Hero(
                     tag: "BookBTN",
                     child: TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectPay(),));
                        },
                       child: Text("Booking Now"),
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
