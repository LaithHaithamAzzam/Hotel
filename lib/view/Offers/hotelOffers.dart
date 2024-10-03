import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/MyOffersProvider.dart';
import 'package:hotel/controller/AllMyOffers.dart';
import 'package:hotel/controller/DeleteOffer.dart';
import 'package:provider/provider.dart';

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
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
      ),
      body: Container(
          margin: EdgeInsets.only(right: 20),
          child: Consumer<MyOffersProvider>(
  builder: (context, provider, child) {
  return provider.data!.isNotEmpty ? ListView.builder(
            itemCount: provider.data?.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 200,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Row(

                                          children: [
                                            Text("Room Type".tr,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                            Text(" ${provider.data?[index].type}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold , color: Color(0xff4C4DDC))),
                                          ],
                                        )),
                                  ],
                                ),
                                Text(
                                  "Start Date".tr + ": ${provider.data?[index].startOfferDate}" "\n" "End Date".tr + ": ${provider.data?[index].endOfferDate}",
                                  style: TextStyle(
                                      color: Color(0xff878787),
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Old Price".tr + ": ${provider.data?[index].price}",
                                          style: TextStyle(
                                              color:  Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Offer Price".tr + ": ${provider.data?[index].newPrice}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Room Numper".tr + ": ${provider.data?[index].roomNumber}",
                                          style: TextStyle(
                                              color: Color(0xff4C4DDC),
                                              fontWeight: FontWeight.bold),
                                        ),

                                        Text("-${(provider.data?[index].discount).toStringAsFixed(2)}%",style:TextStyle(color: Color(0xff4C4DDC) ,fontWeight: FontWeight.bold),),
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
                      onPressed: () async {
                       await DeleteOffer(context).deleteOffer(provider.data![index].id!);

                      },
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
          ):Center(child: Text("You Not Has Offer" , style: TextStyle(fontSize: 16 ),));
  },
)),
    );
  }
}
