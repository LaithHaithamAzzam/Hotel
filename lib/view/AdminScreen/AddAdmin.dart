import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/AddAdmin.dart';

class AddAdmin extends StatelessWidget {
  AddAdmin({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add New Admin".tr),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    ) ,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                    hintText: "Username".tr,suffixIcon: Icon(Icons.supervised_user_circle,color:  Color.fromARGB(255, 76, 77, 220),)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0 , bottom: 28.0),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ) ,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      hintText: "Password".tr,suffixIcon: Icon(Icons.password,color:  Color.fromARGB(255, 76, 77, 220),)
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
              TextButton(
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-20,60)),
                      backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 76, 77, 220)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                  ),
                  onPressed: () async {
               if (username.text.isNotEmpty && password.text.isNotEmpty) {
                 String userName = username.text.trim();
                 await AddAdminAPI(context).addAdmin(userName, password.text);
                 username.clear();
                 password.clear();
               }
                  }, child: Text("Add Admin".tr,style: TextStyle(color:Colors.white,)))
            ],
          ),
        ),
      ),
    );
  }
}
