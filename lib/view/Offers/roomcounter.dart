import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/HotelHomeScreen_Provider.dart';
import 'package:hotel/Providers/SelectRoomsOfferProvider.dart';
import 'package:provider/provider.dart';


class Roomcounteroffers extends StatefulWidget {
  Roomcounteroffers({super.key});
  @override
  State<Roomcounteroffers> createState() => _RoomcounterState();
}
bool Isselected = false;
class _RoomcounterState extends State<Roomcounteroffers> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80.0,top: 50),
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
          backgroundColor: Colors.white,
          actionsAlignment: MainAxisAlignment.center,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          title: Text("Select Rooms".tr,style: TextStyle(color: Colors.black87),textAlign: TextAlign.center),
          content: Column(
            children: [
              Consumer<SelectRoomsOfferProvider>(
                builder: (context, provider, child) {
                  return Container(
                      width: MediaQuery.of(context).size.width - 25,
                      height: MediaQuery.of(context).size.width - 25,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, mainAxisSpacing: 8, crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          int? data = Provider.of<HotelHomeScreenProvider>(context,listen: true).rooms!.elementAt(index).roomNumber!;
                          return Center(child: GestureDetector(
                            onTap: () {
                              print(data);
                              if(provider.Rooms!.contains("$data") == true){
                                provider.remove("$data");
                              }else{
                                provider.Addroom("$data");
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color:  Isselected ? Color(0xff4C4DDC) : Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                  border: Border.all(color: provider.Rooms!.contains("$data")? Color(0xff17187a): Colors.white,width: 2)
                              ),
                              child:Text("$data",style: TextStyle(color:Isselected ? Colors.white :Color(0xff4C4DDC)),),
                            ),
                          ));
                        },
                        itemCount: Provider.of<HotelHomeScreenProvider>(context,listen: true).rooms!.length,
                      ));
                },
              )
            ],
          ),
          actions: [TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("done".tr))],
        ),
      ),
    );
  }
}
