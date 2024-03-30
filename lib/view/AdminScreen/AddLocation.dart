import 'package:flutter/material.dart';
import 'package:hotel/controller/Addlocations.dart';

class AddLocation extends StatelessWidget {
   AddLocation({super.key});
   TextEditingController country = TextEditingController();
   TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add Location Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: country,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  hintText: "Country",suffixIcon: Icon(Icons.location_city_sharp,color:  Color.fromARGB(255, 76, 77, 220),)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0 , bottom: 28.0),
                child: TextFormField(
                  controller: city,
                  decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ) ,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color:  Color.fromARGB(255, 76, 77, 220),style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      ),
                      hintText: "City",suffixIcon: Icon(Icons.location_city_sharp,color:  Color.fromARGB(255, 76, 77, 220),)
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
                  onPressed: (){
                    AddLocationsAPI(context).addLocation(country.text,city.text);
                  }, child: Text("Add Location",style: TextStyle(color:Colors.white,)))
            ],
          ),
        ),
      ),
    );
  }
}
