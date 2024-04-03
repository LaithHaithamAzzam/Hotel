import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Roomcounteroffers extends StatefulWidget {
  Roomcounteroffers({required this.counterroom, super.key});
  int counterroom;
  @override
  State<Roomcounteroffers> createState() => _RoomcounteroffersState();
}

bool Isselected = false;

class _RoomcounteroffersState extends State<Roomcounteroffers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80.0, top: 50),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          backgroundColor: Colors.white,
          actionsAlignment: MainAxisAlignment.center,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          title: Text("Select Rooms".tr,
              style: TextStyle(color: Colors.black87),
              textAlign: TextAlign.center),
          content: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width - 25,
                  height: MediaQuery.of(context).size.width - 25,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Center(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Isselected = !Isselected;
                              print(Isselected);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Isselected
                                    ? Color(0xff4C4DDC)
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                border: Border.all(
                                    color: Isselected
                                        ? Color(0xff17187a)
                                        : Colors.white,
                                    width: 2)),
                            child: Text(
                              ""
                              //${Provider.of<roomTypeCounterProvider>(context,listen: true).rooms!.elementAt(index).roomNumber!}
                              ,
                              style: TextStyle(
                                  color: Isselected
                                      ? Colors.white
                                      : Color(0xff4C4DDC)),
                            ),
                          ),
                        ));
                      },
                      itemCount: 5
                      //Provider.of<roomTypeCounterProvider>(context,listen: true).rooms!.length,
                      ))
            ],
          ),
          actions: [TextButton(onPressed: () {}, child: Text("done".tr))],
        ),
      ),
    );
  }
}
