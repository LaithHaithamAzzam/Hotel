import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/controller/Addlocations.dart';

class AddLocation extends StatelessWidget {
   AddLocation({super.key});
   TextEditingController Country = TextEditingController();
   TextEditingController City = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add Location Screen".tr),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: Country,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  hintText: "Country".tr,suffixIcon: Icon(Icons.location_city_sharp,color:  Color.fromARGB(255, 76, 77, 220),)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0 , bottom: 28.0),
                child: TextFormField(
                  controller: City,
                  decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ) ,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      hintText: "City".tr,suffixIcon: Icon(Icons.location_city_sharp,color:  Color.fromARGB(255, 76, 77, 220),)
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
                  onPressed: ()async{
                 if(City.text.isNotEmpty && Country.text.isNotEmpty){
                   await AddLocationsAPI(context).addLocation(Country.text,City.text);
                   City.clear();
                 }
                  }, child: Text("Add Location".tr,style: TextStyle(color:Colors.white,)))
            ],
          ),
        ),
      ),
    );
  }
}
