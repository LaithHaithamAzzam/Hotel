import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel/Icons/my_hoteli_icons.dart';
import 'package:hotel/Providers/NotificationProvider.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/view/HomeScreen/NotificationScreen.dart';
import 'package:hotel/view/MyWidgite/Searchbottombar.dart';
import 'package:provider/provider.dart';

import '../../controller/GetHotel.dart';
import '../../controller/api.dart';
import '../HotelScreen/Detail_Hotel_User.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          actions: [
            Consumer<NotificationProvider>(
              builder: (context, notiProv, child) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(children: [
                        Hero(
                          tag: "notification-icon",
                          child: IconButton(
                            onPressed: () {
                              notiProv.AddCountNotification(0);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Notifications(),
                              ));
                            },
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStatePropertyAll(Size(40, 40)),
                                iconColor:
                                    MaterialStatePropertyAll(Colors.black),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Color(0xffEDEDED),
                                            width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6))))),
                            icon: notiProv.counter > 0
                                ? Icon(MyHoteli.notifications)
                                    .animate(
                                        onPlay: (controller) =>
                                            controller.repeat())
                                    .shake(
                                        delay: Duration(seconds: 1),
                                        duration: Duration(milliseconds: 500))
                                : Icon(MyHoteli.notifications),
                          ),
                        ),
                        notiProv.counter > 0
                            ? Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${notiProv.counter}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))))
                            : Container(),
                      ]),
                      SearchBar(
                        trailing: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => SerchBottom(),
                                );
                              },
                              style: ButtonStyle(
                                  iconSize: MaterialStatePropertyAll(15),
                                  minimumSize:
                                      MaterialStatePropertyAll(Size(35, 35)),
                                  maximumSize:
                                      MaterialStatePropertyAll(Size(35, 35)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xff4C4DDC)),
                                  iconColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))))),
                              icon: Icon(
                                MyHoteli.settings,
                              ),
                            ),
                          ],
                        ).children.toList(),
                        constraints: BoxConstraints(
                            minHeight: 40,
                            maxHeight: 40,
                            maxWidth: MediaQuery.of(context).size.width / 1.3,
                            minWidth: MediaQuery.of(context).size.width / 1.3),
                        surfaceTintColor:
                            MaterialStatePropertyAll(Colors.white),
                        shadowColor:
                            MaterialStatePropertyAll(Colors.transparent),
                        hintText: "Serch Hotel",
                        hintStyle: MaterialStatePropertyAll(
                            TextStyle(color: Color(0xff878787), fontSize: 16)),
                        leading: Icon(
                          Icons.search,
                          color: Color(0xff878787),
                        ),
                        overlayColor: MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(
                                color: Color(0xffEDEDED),
                                width: 1,
                                style: BorderStyle.solid))),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby your location",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4C4DDC)),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Consumer<allHotelProvider>(
                  builder: (context, allhotelprovider, child) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await GetHotel(context).getHotel((allhotelprovider.data?[index].userId).toString(),index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20, top: 20, bottom: 10),
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurStyle: BlurStyle.outer,
                                          spreadRadius: 0,
                                          offset: Offset(0, 4),
                                          blurRadius: 6)
                                    ]),
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: "Hotel${index}",
                                      child: Container(
                                        width: 257,
                                        height: 209,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${SERVER}${Showimage}/${allhotelprovider.data?[index].imageId}",
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0, top: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        "${allhotelprovider.data?[index].name}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffFFD33C),
                                                ),
                                                Text(
                                                    allhotelprovider
                                                                .data![index]
                                                                .rate ==
                                                            null
                                                        ? "0"
                                                        : "5.0",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${allhotelprovider.data![index].location!.country} - ${allhotelprovider.data![index].location!.city}",
                                                  style: TextStyle(
                                                      color: Color(0xff878787),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${allhotelprovider.data?[index].minPrice}",
                                                  style: TextStyle(
                                                      color: Color(0xff4C4DDC),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "/night",
                                                  style: TextStyle(
                                                      color: Color(0xff878787),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, right: 5.0),
                              child: Hero(
                                tag: "Fev${index}",
                                child: IconButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        iconSize: MaterialStatePropertyAll(22),
                                        minimumSize: MaterialStatePropertyAll(
                                            Size(40, 40)),
                                        maximumSize: MaterialStatePropertyAll(
                                            Size(40, 40)),
                                        backgroundColor: MaterialStatePropertyAll(
                                            Colors.white),
                                        iconColor: MaterialStatePropertyAll(
                                            Color(0xff4C4DDC)),
                                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Color(0xffEDEDED),
                                                width: 1.5),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(40))))),
                                    icon: allhotelprovider.data?[index].isFav == true
                                        ? Icon(MyHoteli.love)
                                        : Icon(Icons.favorite_outline)),
                              ),
                            ),
                          ],
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: allhotelprovider.data?.length,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Destination",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4C4DDC)),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Detile_Hotel(Herotag: "Hotel$index" "pop"),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                  blurRadius: 6)
                            ]),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 5, top: 10, right: 10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 105,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Hero(
                                tag: "Hotel$index" "pop",
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, bottom: 0),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://img.freepik.com/premium-photo/minsk-belarus-august-2017-columns-guestroom-hall-reception-modern-luxury-hotel_97694-6572.jpg"))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, top: 5, bottom: 5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("The Burj Alreem",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: [
                                        Text(
                                          "SP 180.000",
                                          style: TextStyle(
                                              color: Color(0xff4C4DDC),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "/night",
                                          style: TextStyle(
                                              color: Color(0xff878787),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Qanawat Street, Swidaa",
                                      style:
                                          TextStyle(color: Color(0xff878787)),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Color(0xffFFD33C)),
                                        Icon(Icons.star,
                                            color: index >= 1
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Icon(Icons.star,
                                            color: index >= 2
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Icon(Icons.star,
                                            color: index >= 3
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Icon(Icons.star,
                                            color: index >= 4
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Text("5.0",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
