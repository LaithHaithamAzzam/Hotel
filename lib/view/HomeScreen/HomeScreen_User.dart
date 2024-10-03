import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:hotel/Icons/my_hoteli_icons.dart';
import 'package:hotel/Providers/NotificationProvider.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/controller/AllHotelAPI.dart';
import 'package:hotel/view/HomeScreen/NotificationScreen.dart';
import 'package:hotel/view/MyWidgite/Searchbottombar.dart';
import 'package:provider/provider.dart';
import '../../controller/GetHotel.dart';
import '../../controller/FavouriteAPIs.dart';
import '../../controller/api.dart';

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
                            icon: notiProv.counter! > 0
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
                        notiProv.counter! > 0
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
                      "All Popular Hotels".tr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.trending_up ,color: Color(0xff4C4DDC),size: 25,)
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Consumer<allHotelProvider>(
                  builder: (context, allhotelprovider, child) {
                    return allhotelprovider.data != null ? ListView.builder(
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await GetHotel(context).getHotel((allhotelprovider.data?[index].userId).toString(),index,false);
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
                                        color: Colors.black54,
                                        blurStyle: BlurStyle.solid,
                                        spreadRadius: 0,
                                        offset: Offset(0, 0)
                                        ,blurRadius: 5
                                    ),
                                  ],
                                ),
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
                                                        : "${  allhotelprovider
                                                        .data![index]
                                                        .rate}.0",
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
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
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
                                                     "/night".tr,
                                                     style: TextStyle(
                                                         color: Color(0xff878787),
                                                         fontWeight:
                                                         FontWeight.bold),
                                                   ),
                                                 ],
                                               ),
                                                allhotelprovider.data![index].isOffer == true ? Icon(Icons.sell ,color: Colors.red,) : Text("")
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
                                    onPressed: () async {
                                      if(allhotelprovider.data?[index].isFav==false){
                                        await FavouriteAPIs(context).addFavourite(int.parse((allhotelprovider.data?[index].userId).toString()),index , false);
                                      }else{
                                        await FavouriteAPIs(context).DeleteFavourite(int.parse((allhotelprovider.data?[index].userId).toString()),index,false);
                                      }
                                    },
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
                    ):  IconButton(onPressed: ()async{
                      await allHotelAPI(context).allHotel();
                    }, icon: Icon(Icons.refresh_sharp , color: Color.fromARGB(255, 76, 77, 220),size: 40,))
                    ;
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
                      "Hotels Offers".tr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.local_offer ,color: Colors.red,)
                  ],
                ),
              ),
              Consumer<allHotelProvider>(
  builder: (context, allHotelProvider, child) {
  return allHotelProvider.data != null ?Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: ListView.builder(

                  itemBuilder: (context, index) {
                    return allHotelProvider.data![index].isOffer==true?GestureDetector(
                      onTap: ()async {
                        await GetHotel(context).getHotel((allHotelProvider.data?[index].userId).toString(),index,false);

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurStyle: BlurStyle.solid,
                                spreadRadius: 0,
                                offset: Offset(0, 0)
                                ,blurRadius: 5
                            ),
                          ],
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 10.0, top: 7, right: 10.0 ,bottom: 7),
                        width: MediaQuery.of(context).size.width,
                        height: 105,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Hero(
                                tag: "Hotel$index""pop",
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
                                            "${SERVER}${Showimage}/${allHotelProvider.data?[index].imageId}",
                                          ))),
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
                                    Text("${ allHotelProvider.data![index].name}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: [
                                        Text(
                                          "SP ${ allHotelProvider.data![index].minPrice}",
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
                                    Text(
                                      "${allHotelProvider.data![index].location!.country} - ${allHotelProvider.data![index].location!.city}",
                                      style:
                                          TextStyle(color: Color(0xff878787)),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color:int.parse(( allHotelProvider.data![index].rate).toString()) >= 1
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Icon(Icons.star,
                                            color:int.parse(( allHotelProvider.data![index].rate).toString()) >= 2
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Icon(Icons.star,
                                            color: int.parse(( allHotelProvider.data![index].rate).toString()) >= 3
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Icon(Icons.star,
                                            color: int.parse(( allHotelProvider.data![index].rate).toString()) >= 4
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Icon(Icons.star,
                                            color: int.parse(( allHotelProvider.data![index].rate).toString()) > 5
                                                ? Color(0xffFFD33C)
                                                : Color(0xff878787)),
                                        Text(
                                            allHotelProvider
                                                .data![index]
                                                .rate ==
                                                null
                                                ? "0"
                                                : "${  allHotelProvider
                                                .data![index]
                                                .rate}.0",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                        :Text('');
                  },
                  scrollDirection: Axis.vertical,
                  itemCount:  allHotelProvider.data!.length,
                ),
              ) : IconButton(onPressed: ()async{
    await allHotelAPI(context).allHotel();
  }, icon: Icon(Icons.refresh_sharp , color: Color.fromARGB(255, 76, 77, 220),size: 40,))
  ;
  },
)
            ],
          ),
        ),
      ),
    );
  }
}
