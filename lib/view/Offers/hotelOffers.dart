import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addOffers.dart';

class HotelOffers extends StatefulWidget {
  const HotelOffers({super.key});

  @override
  State<HotelOffers> createState() => _HotelOffersState();
}

class _HotelOffersState extends State<HotelOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => addOffersBottomsheet(),
          );
        },
        backgroundColor: Color.fromARGB(255, 76, 77, 220),
        child: const Icon(
          Icons.playlist_add_sharp,
          color: Colors.white,
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(right: 20),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 250,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 0,
                              offset: const Offset(0, 4),
                              blurRadius: 6)
                        ]),
                    child:  Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text("Room Type".tr,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "between Start Date -> End Date".tr,
                                      style: TextStyle(
                                          color: Color(0xff878787),
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Minimum Price".tr,
                                          style: TextStyle(
                                              color: Color(0xff4C4DDC),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "/night".tr,
                                          style: TextStyle(
                                              color: Color(0xff878787),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 5.0),
                    child: IconButton(
                      onPressed: () async {},
                      style: const ButtonStyle(
                          iconSize: MaterialStatePropertyAll(20),
                          minimumSize: MaterialStatePropertyAll(Size(40, 40)),
                          maximumSize: MaterialStatePropertyAll(Size(40, 40)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          iconColor:
                              MaterialStatePropertyAll(Color(0xff4C4DDC)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color(0xffEDEDED), width: 1.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))))),
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
