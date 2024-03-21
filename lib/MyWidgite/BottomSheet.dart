import 'package:flutter/material.dart';

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
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0 , bottom: 10.0),
            child: Text("Room Type" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 16),),
          ) ,
         Expanded(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               DropdownMenuExample(),
               Text("SP 190.000 /Night",style:TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
               Padding(
                 padding: const EdgeInsets.only(left: 20.0 , right: 20.0),
                 child: Hero(
                   tag: "BookBTN",
                   child: TextButton(
                      onPressed: (){},
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
         )
        ],
      ),
    );
  }
}
