import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/NotificationProvider.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications".tr),
        centerTitle: true,

      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Provider.of<NotificationProvider>(context , listen: false).data != null ?
        ListView.builder(itemBuilder: (context, index) {
          return InkWell(
            onTap: (){

            },
            overlayColor: MaterialStatePropertyAll(Color(0x104c4ddc) ),
            child: ListTile(
              leading: Icon(Icons.villa_outlined),
              title: Text("${Provider.of<NotificationProvider>(context , listen: false).data![index].name} "),
              subtitle: Text("Your Room IS".tr+ ": ${Provider.of<NotificationProvider>(context , listen: false).data![index].roomNumber} \n Start Date: ${Provider.of<NotificationProvider>(context , listen: false).data![index].startDate} \n End Date: ${Provider.of<NotificationProvider>(context , listen: false).data![index].endDate}"),
            ),
          );
        },
        itemCount: Provider.of<NotificationProvider>(context , listen: false).data!.length,
        ):Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You Dont Have Any Notification".tr),
            ],
          ),
        )
      ),
    );
  }
}
// , color: Color(0xff4C4DDC),
