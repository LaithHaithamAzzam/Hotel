import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel/Providers/RoomDertailProvider.dart';
import 'package:provider/provider.dart';

Roomdate(BuildContext context) {
  return Container(
    width: MediaQuery
        .of(context)
        .size
        .width / 2,
    alignment: Alignment.center,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: AlertDialog(
        actions:[ Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)
            ),
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .width - 50,
              child: ListView.builder(itemCount: Provider.of<RoomDertailProvider>(context).bookings?.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration( color: Color(0xff3D36A4),borderRadius: BorderRadius.all(Radius.circular(6))),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Start Date: ${Provider.of<RoomDertailProvider>(context).bookings![index].startDate}" , style: TextStyle(color: Colors.white)),
                        )
                       , Padding(
                         padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0),
                         child: Text("End Date: ${Provider.of<RoomDertailProvider>(context).bookings![index].endDate}", style: TextStyle(color: Colors.white)),
                       )
                      ],
                    ),
                  );
                },),
            )
        ),
  ]
      ),
    ),
  );
}