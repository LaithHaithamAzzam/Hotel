import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:hotel/Icons/my_hoteli_icons.dart';
import 'package:hotel/controller/FavoriteHotel.dart';
import 'package:provider/provider.dart';

import '../../Providers/AllFavHotelsProvider.dart';
import '../../Providers/BottombarProvider.dart';




class Bottombar extends StatefulWidget {
  @override
  BottombarState createState() => BottombarState();

}

class BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.only(topRight:  Radius.circular(10),topLeft: Radius.circular(10)),
      ),
      child: Consumer<BBProvider>(
  builder: (context, provider, child) {
  return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, index) => InkWell(
          onTap: () async{
            provider.setcurrentindex(index);
            HapticFeedback.lightImpact();
            if(index == 1){
              Provider.of<AllFavHotelsProvider>(context,listen: false).Setstate(false);
              await FavouriteHotels(context).showFev();
            }
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == provider.currentIndex
                    ? displayWidth * .32
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == provider.currentIndex ? displayWidth * .12 : 0,
                  width: index == provider.currentIndex ? displayWidth * .32 : 0,
                  decoration: BoxDecoration(
                    color: index == provider.currentIndex
                        ? Color(0xff4C4DDC).withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == provider.currentIndex
                    ? displayWidth * .31
                    : displayWidth * .20,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width:
                          index == provider.currentIndex ? displayWidth * .10 : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == provider.currentIndex ? 1 : 0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == provider.currentIndex
                                ? '${listOfStrings[index]}'
                                : '',
                            style: TextStyle(
                              color: Color(0xff4C4DDC),
                              fontWeight: FontWeight.w600,
                              fontSize: displayWidth * .040,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width:
                          index == provider.currentIndex ? displayWidth * .02 : 20,
                        ),
                        Icon(
                          listOfIcons[index],
                          size: displayWidth * .070,
                          color: index == provider.currentIndex
                              ? Color(0xff4C4DDC)
                              : Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }

  List<IconData> listOfIcons = [
    MyHoteli.home,
    MyHoteli.favorate,
    Icons.settings_rounded,
    Icons.wallet,
  ];

  List<String> listOfStrings = [
    'Home'.tr,
    'Favorite'.tr,
    'Settings'.tr,
    'Wallet'.tr,
  ];
}


