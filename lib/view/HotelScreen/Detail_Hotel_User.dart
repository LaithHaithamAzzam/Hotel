import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:hotel/Icons/my_hoteli_icons.dart';
import 'package:hotel/Providers/SerchProvider.dart';
import 'package:hotel/Providers/SetRateProvider.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/controller/api.dart';
import 'package:hotel/controller/rate.dart';
import 'package:hotel/view/MyWidgite/ShowImage.dart';
import 'package:provider/provider.dart';
import '../../Providers/HotelRoomsProvider.dart';
import '../../Providers/NotificationProvider.dart';
import '../../Providers/roomTypesProvider.dart';
import '../../controller/FavouriteAPIs.dart';
import '../HomeScreen/NotificationScreen.dart';
import '../MyWidgite/BottomSheet.dart';
import '../MyWidgite/textread.dart';

class Detile_Hotel extends StatelessWidget {
  Detile_Hotel({this.Herotag,this.isserch,this.hotelid,required this.index, super.key});
  String? Herotag;
  int? hotelid;
  int index;
  bool? isserch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Hero(
          tag: "BookBTN",
          child: TextButton(
            onPressed: ()async{
              showModalBottomSheet(
                context: context,
                builder: (context) => Bottomsheet(),

              );

            },
            child: Text("Booking Now".tr),
            style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),
                minimumSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width - 10, 60)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))))),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        actions: [
          Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<NotificationProvider>(
                    builder: (context, notiProv, child) {
                      return Stack(children: [
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
                      ]);
                    },
                  ),
                  Text(
                    "Detile".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(40, 40)),
                        iconColor: MaterialStatePropertyAll(Colors.black),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color(0xffEDEDED), width: 1.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6))))),
                    icon: Icon(
                      Icons.more_horiz_rounded,
                    ),
                  ),
                ],
              )),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Hero(
                        tag: "$Herotag",
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.96,
                          height: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "$SERVER""$Showimage/${ Provider.of<HotelRoomsProvider>(context , listen:  false).imageId}"
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Consumer<allHotelProvider>(
  builder: (context, allhotelprovider, child) {
  return Hero(
                        tag: "Fev${Herotag}",
                        child: IconButton(
                            onPressed: () async {
                              if(isserch == true){
                                print(isserch);
                                if(allhotelprovider.data?[index].isFav==false){
                                  await FavouriteAPIs(context).addFavourite(int.parse((Provider.of<SerchProvider>(context , listen: false).data?[index].userId).toString()),index,true);
                                }else{
                                  await FavouriteAPIs(context).DeleteFavourite(int.parse((Provider.of<SerchProvider>(context , listen: false).data?[index].userId).toString()),index,true);
                                }
                              }
                            else{
                                if(allhotelprovider.data?[index].isFav==false){
                                  await FavouriteAPIs(context).addFavourite(int.parse((allhotelprovider.data?[index].userId).toString()),index,false);
                                }else{
                                  await FavouriteAPIs(context).DeleteFavourite(int.parse((allhotelprovider.data?[index].userId).toString()),index,false);
                                }
                              }
                            },
                          style: ButtonStyle(
                              iconSize: MaterialStatePropertyAll(20),
                              minimumSize:
                                  MaterialStatePropertyAll(Size(40, 40)),
                              maximumSize:
                                  MaterialStatePropertyAll(Size(40, 40)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              iconColor:
                                  MaterialStatePropertyAll(Color(0xff4C4DDC)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Color(0xffEDEDED), width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))))),
                          icon: allhotelprovider.data?[index].isFav == true ?Icon(
                            MyHoteli.love,
                          ):
                          Icon(Icons.favorite_outline),
                        ),
                      );
  },
),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5, top: 5),
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5FF),
                        borderRadius:
                        BorderRadius.all(Radius.circular(8))),
                    child: Container(
                      margin:
                      EdgeInsets.only(bottom: 5, right: 5, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Color(0xffFFD33C)),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                    Provider.of<HotelRoomsProvider>(context , listen: false).rate! == null ?
                                    "0.0":
                                    "${Provider.of<HotelRoomsProvider>(context , listen: false).rate!}.0",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: ()async{
                                  await RateAPI(context).Rate(1, hotelid);
                                  Provider.of<SetRateProvider>(context , listen: false).setrate(1);
                                },
                                  child: Icon( Icons.star, color: Provider.of<SetRateProvider>(context , listen: false).rate>=1 ?Color(0xffFFD33C) : Colors.grey,
                                  )),
                              GestureDetector(
                                  onTap: ()async{
                                    await RateAPI(context).Rate(2, hotelid);
                                    Provider.of<SetRateProvider>(context , listen: false).setrate(2);
                                  },
                                  child: Icon(Icons.star, color:  Provider.of<SetRateProvider>(context , listen: false).rate>=2 ?Color(0xffFFD33C) : Colors.grey,
                                  )),
                              GestureDetector(
                                  onTap: ()async{
                                    await RateAPI(context).Rate(3, hotelid);
                                    Provider.of<SetRateProvider>(context , listen: false).setrate(3);
                                  },
                                  child: Icon(Icons.star, color:  Provider.of<SetRateProvider>(context , listen: false).rate>=3 ?Color(0xffFFD33C) : Colors.grey,
                                  )),
                              GestureDetector(
                                  onTap: ()async{
                                    await RateAPI(context).Rate(4, hotelid);
                                    Provider.of<SetRateProvider>(context , listen: false).setrate(4);
                                  },
                                  child: Icon(Icons.star, color:  Provider.of<SetRateProvider>(context , listen: false).rate>=4 ?Color(0xffFFD33C) : Colors.grey,
                                  )),
                              GestureDetector(
                                  onTap: ()async{
                                    await RateAPI(context).Rate(5, hotelid);
                                    Provider.of<SetRateProvider>(context , listen: false).setrate(5);
                                  },
                                  child: Icon(Icons.star, color:  Provider.of<SetRateProvider>(context , listen: false).rate>=5 ?Color(0xffFFD33C) : Colors.grey,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(Provider.of<SetRateProvider>(context , listen: true).rate==0 ? "0" :"(${Provider.of<SetRateProvider>(context , listen: false).rate})" , style: TextStyle(fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0 , bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${Provider.of<HotelRoomsProvider>(context , listen: false).name}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .15),
                          child: Row(
                            children: [
                              Text(
                                "SP".tr +"${Provider.of<HotelRoomsProvider>(context , listen: false).minPrice}",
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
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Color(0xff4C4DDC),
                          size: 23,
                        ),
                        Text(
                          "${Provider.of<HotelRoomsProvider>(context , listen: false).country}"" - ${Provider.of<HotelRoomsProvider>(context , listen: false).city}",
                          style:
                          TextStyle(color: Color(0xff878787), fontSize: 13),
                        ),
                      ],
                    ),
          Provider.of<HotelRoomsProvider>(context , listen: false).StartDate != null ? Column(
                        children: [
                          Text(
                            "Start Offer Date".tr +" ${Provider.of<HotelRoomsProvider>(context , listen: false).StartDate}",
                            style: TextStyle(
                                color: Color(0xff4C4DDC),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "End Offer Date".tr+" ${Provider.of<HotelRoomsProvider>(context , listen: false).EndDate}",
                            style: TextStyle(
                                color: Color(0xff878787),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ):Text(""),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Text("Description".tr,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0 , right: 4.0),
                    child: ExpandableText(
                      "- Description ${Provider.of<HotelRoomsProvider>(context , listen: false).detail}"
                      "\n - Location Description : ${Provider.of<HotelRoomsProvider>(context , listen: false).locationDetail}"
                          "\n - Rooms type: ${Provider.of<RoomTypesProvider>(context,listen: false).data.toString().replaceAll("[", "").replaceAll("]", "")}",
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Preview".tr,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.view_carousel_rounded,color:Color(0xff4C4DDC),size: 25,)
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.width/1.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),),
                  child: Provider.of<HotelRoomsProvider>(context , listen:  false).preview!.isNotEmpty ?
                  PageView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowImage(
                              HERO : "prev",
                              URL:
                              "$SERVER""$Showimage""/${Provider.of<HotelRoomsProvider>(context , listen:  false).preview?[index]}"
                          ),));
                        },
                        child: Hero(
                          tag: "prev",
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "$SERVER""$Showimage""/${Provider.of<HotelRoomsProvider>(context , listen:  false).preview?[index]}"
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      );
                    },
                    itemCount: Provider.of<HotelRoomsProvider>(context,listen: false).preview?.length,
                  ):Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: Color(0xff4C4DDC)
                    ),
                    child: Text("No Image Of Preview".tr,style: TextStyle(color: Colors.white),),
                  )
                  ,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
