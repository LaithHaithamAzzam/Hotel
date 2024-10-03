import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/DarwerProvider.dart';
import 'package:hotel/Providers/HotelHomeScreen_Provider.dart';
import 'package:hotel/Providers/HotelRoomsProvider.dart';
import 'package:hotel/Providers/customerInformationProvider.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:hotel/controller/api.dart';
import 'package:hotel/view/MyWidgite/ShowImage.dart';
import 'package:provider/provider.dart';



class HotelHomeScreen extends StatelessWidget {
   HotelHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        centerTitle: true,
        title:Text(
          Provider.of<customerInformationProvider>(context,listen: true).name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if( Provider.of<DraweProvider>(context , listen: false).isopen == false){
                Provider.of<DraweProvider>(context , listen: false).opendrawer(true);
              }
            },
            style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(40, 40)),
                iconColor: MaterialStatePropertyAll(Colors.black),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color(0xffEDEDED), width: 1.5),
                    borderRadius:
                    BorderRadius.all(Radius.circular(6))))),
            icon:Icon(
              Icons.more_horiz_rounded,
            )
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowImage(HERO : "hotel" ,
                        URL:
                           "$SERVER""$Showimage""/${Provider.of<customerInformationProvider>(context , listen:  false).imageid}"
                    ),));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Hero(
                          tag: "hotel",
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            height: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(6)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "$SERVER""$Showimage""/${Provider.of<customerInformationProvider>(context , listen:  false).imageid}"
                                      ,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ],
                    ),
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
                    child: Consumer<HotelRoomsProvider>(
  builder: (context, provider, child) {
    int? rate = provider.rate != null ? int.parse(provider.rate.toString()): 0;
  return Container(
                        margin:
                        EdgeInsets.only(bottom: 5, right: 5, left: 5),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star,
                                color: rate > 0
                                    ? Color(0xffFFD33C)
                                    : Color(0xff878787)),
                            Icon(Icons.star,
                                color: rate >1
                                    ? Color(0xffFFD33C)
                                    : Color(0xff878787)),
                            Icon(Icons.star,
                                color: rate > 2
                                    ? Color(0xffFFD33C)
                                    : Color(0xff878787)),
                            Icon(Icons.star,
                                color: rate > 3
                                    ? Color(0xffFFD33C)
                                    : Color(0xff878787)),
                            Icon(Icons.star,
                                color: rate > 4
                                    ? Color(0xffFFD33C)
                                    : Color(0xff878787)),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text( provider.rate != null ? "${Provider.of<HotelRoomsProvider>(context , listen: false).rate}.0" : "Not Rated",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                    );
  },
),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.monetization_on ,  color: Color(0xff4C4DDC),size: 20,),
                        Text(
                          "SP".tr+"${Provider.of<HotelRoomsProvider>(context , listen: false).minPrice}",
                          style: TextStyle(
                              color: Color(0xff4C4DDC),
                              fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                        Text(
                          "/night".tr,
                          style: TextStyle(
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Color(0xff4C4DDC),
                            size: 23,
                          ),
                          Text(
                            " ${Provider.of<HotelRoomsProvider>(context , listen: false).country}"" -  ${Provider.of<HotelRoomsProvider>(context , listen: false).city}",
                            style:
                            TextStyle(color: Color(0xff878787), fontSize: 16),
                          )
                        ],
                      ),
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
                    child: Text(
                      "- ${Provider.of<HotelRoomsProvider>(context , listen: false).detail}"
                          "\n"+ "- Location Description".tr+ ":"+ "${Provider.of<HotelRoomsProvider>(context , listen: false).locationDetail}"
                          "\n"+  "Rooms type".tr+":" +"${Provider.of<RoomTypesProvider>(context).types.toString().replaceAll("[", "").replaceAll("]", "")}",
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
                  child:(Provider.of<HotelHomeScreenProvider>(context , listen:  false).previewimage!).isNotEmpty ?
                  PageView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowImage(
                            HERO : "prev",
                            URL:
                            "$SERVER""$Showimage""/${Provider.of<HotelHomeScreenProvider>(context , listen:  false).previewimage?[index]}"
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
                                        "$SERVER""$Showimage""/${Provider.of<HotelHomeScreenProvider>(context , listen:  false).previewimage?[index]}"
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      );
                    },
                    itemCount: Provider.of<HotelHomeScreenProvider>(context,listen: false).previewimage?.length,
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
