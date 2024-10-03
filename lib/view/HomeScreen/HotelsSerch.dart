import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/SerchProvider.dart';
import 'package:hotel/controller/FavouriteAPIs.dart';
import 'package:hotel/controller/api.dart';
import 'package:provider/provider.dart';
import '../../Icons/my_hoteli_icons.dart';
import '../../controller/GetHotel.dart';


class HotelSerch extends StatefulWidget {
  const HotelSerch({super.key});

  @override
  State<HotelSerch> createState() => _HotelSerchState();
}

class _HotelSerchState extends State<HotelSerch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Container(
          margin: EdgeInsets.only(right: 20),
          child: Consumer<SerchProvider>(
            builder: (context, provider, child) {
              return provider.State == true ? provider.data!.isNotEmpty ? ListView.builder(itemBuilder: (context, index) {
                return  Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GestureDetector(
                      onTap: ()async{
                        await GetHotel(context).getHotel((provider.data?[index].userId).toString(),index,true);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,top: 20 , bottom: 10 ),
                        width: MediaQuery.of(context).size.width ,
                        height: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4)
                                  ,blurRadius: 6
                              )
                            ]
                        ),

                        child: Column(

                          children: [
                            Hero(
                              tag:"Hotel${index}",
                              child: Container(
                                width:  MediaQuery.of(context).size.width,
                                height: 209,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                    image: DecorationImage(image: NetworkImage(
                                      "${SERVER}${Showimage}/${provider.data?[index].imageId}",
                                    ),fit: BoxFit.cover,)
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0 , right: 8.0 , top: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text("${provider.data?[index].name}", style: TextStyle(fontWeight: FontWeight.bold))),
                                        Icon(Icons.star , color: Color(0xffFFD33C),) ,
                                        Text(provider.data?[index].rate != null ?"${provider.data?[index].rate}.0" : "0.0", style: TextStyle(fontWeight: FontWeight.bold))
                                      ],
                                    ) ,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("${provider.data?[index].location?.country}"" - ${provider.data?[index].location?.city}" , style: TextStyle(color: Color(0xff878787), fontWeight: FontWeight.bold),)
                                      ],
                                    ) ,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text("SP".tr +"${provider.data?[index].minPrice}" , style: TextStyle(color: Color(0xff4C4DDC) , fontWeight: FontWeight.bold),),
                                            Text("/night".tr , style: TextStyle(color: Color(0xff878787), fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        provider.data![index].isOffer == true ? Icon(Icons.sell ,color: Colors.red,) : Text("")
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
                  ],
                );
              },
                itemCount: provider.data?.length,
              ):Center(child: Text("No Results".tr , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xff4C4DDC)),)):Center(child: CircularProgressIndicator());
            },
          ),
        )
      )
    );
  }
}
