import 'package:flutter/material.dart';
import 'package:hotel/Providers/LocationsProvider.dart';
import 'package:hotel/Providers/SelectionDropDownList.dart';
import 'package:provider/provider.dart';

class dropdowncutom extends StatefulWidget {
  const dropdowncutom({super.key});

  @override
  State<dropdowncutom> createState() => _dropdowncutomState();
}

class _dropdowncutomState extends State<dropdowncutom> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      autofocus: false,
      underline: const Text(
        '',
        style: TextStyle(color: Colors.white),
      ),
      borderRadius: BorderRadius.circular(10),
      iconEnabledColor: const Color.fromARGB(255, 76, 77, 220),
      style: const TextStyle(color: Colors.black),
      value: Provider.of<SelectionDropDownList>(context , listen: false).item,
      onChanged: (newValue) {
       setState(() {
         Provider.of<SelectionDropDownList>(context , listen: false).SetValue(newValue!);
       });
      },
      isExpanded: true,
      items: <String>[
        'Hollywood Twin Room',
        'Sweet',
        'Super Delux',
        'Double-double',
        'Studio'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}






class LocationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:  Container(
        width: MediaQuery.of(context).size.width - 50,
        height: MediaQuery.of(context).size.width - 50,
        child: ListView.builder(itemBuilder: (context, index) {
          return GestureDetector(
              onTap: (){
                Provider.of<LocationProvider>(context , listen: false).Selectlocation("${Provider.of<LocationProvider>(context , listen: false).data?.elementAt(index).country} - ${Provider.of<LocationProvider>(context , listen: false).data?.elementAt(index).city}",index+1);
                Navigator.of(context).pop();
                },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 76, 77, 220),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(child: Text("${Provider.of<LocationProvider>(context , listen: false).data?.elementAt(index).country} - ${Provider.of<LocationProvider>(context , listen: false).data?.elementAt(index).city}",style:TextStyle(color: Colors.white) ,)),
                    )),
              ));
        },itemCount: Provider.of<LocationProvider>(context , listen: false).data?.length),
      ),
    );
  }
}

