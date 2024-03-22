import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(Icons.delete),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: ListView.builder(itemBuilder: (context, index) {
          return InkWell(
            onTap: (){},
            overlayColor: MaterialStatePropertyAll(Color(0x104c4ddc) ),
            child: ListTile(
              leading: Icon(Icons.villa_outlined),
              trailing: Icon(Icons.navigate_next),
              title: Text("The Burj Alreem Hotel"),
              subtitle: Text("Done Booking Room"),
            ),
          );
        },
        itemCount: 4,
        ),
      ),
    );
  }
}
// , color: Color(0xff4C4DDC),
