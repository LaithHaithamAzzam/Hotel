import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/SelectionDropDownList.dart';
import 'package:hotel/view/MyWidgite/buttons.dart';
import 'package:hotel/view/MyWidgite/dropdown.dart';
import 'package:hotel/view/MyWidgite/textField.dart';
import 'package:provider/provider.dart';
import '../../Providers/CreateHotelProvider.dart';
import '../../Providers/ImageProvider.dart';
import '../../Providers/LocationsProvider.dart';
import '../../controller/registeHotelAPI.dart';

class HotelDetails extends StatefulWidget {
  const HotelDetails({super.key});

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  TextEditingController minimumPrice = TextEditingController();
  TextEditingController LocationDescription = TextEditingController();
  TextEditingController Description = TextEditingController();
  TextEditingController roomcounter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "Enter the Details of your Hotel ".tr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 76, 77, 220),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                child:  GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (context) => LocationsList(),);
                  },
                  child: Consumer<LocationProvider>(
  builder: (context, provider, child) {
  return Container(
    alignment: Alignment.center,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                      ),
                      height: 60,
                      width: _w * 0.9,
                      child: Text("${provider.Loc}",style: TextStyle(color: provider.Loc == "Select Location" ? Colors.grey:Colors.black),));
  },
),
                ),
              ),
            
              Padding(
                padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                child: textFieldCustom(
                    controler: roomcounter, labelText: "Number of Rooms".tr,keyboard: TextInputType.number),
              ),
            
              Padding(
                padding: EdgeInsets.only(left: _w * 0.08, right: _w * 0.08),
                child: textFieldCustom(
                    controler: minimumPrice, labelText: "Minimum Price".tr,keyboard: TextInputType.number),
              ),
            
              Padding(
                padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                child: textFieldCustom(
                    controler: Description, labelText: "Description".tr),
              ),
              Padding(
                padding: EdgeInsets.only(right: _w * 0.08, left: _w * 0.08),
                child: textFieldCustom(
                    controler: LocationDescription,
                    labelText: "Location Description".tr),
              ),
            
              Container(
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              height: _h * 0.08,
                              width: _w * 0.8,
                              child: dropdowncutom()),
              Consumer<CreateHotelProvider>(
                builder: (context, Prov, child) {
  return MaterialButtonCustom(
                materialtext: 'Add Hotel'.tr,
                onpressed: ()async {
                 await CreateHotelAccount(context).createHotelAccount("${Prov.hotelname}","${Prov.username}","${Prov.password}",int.parse((Provider.of<LocationProvider>(context,listen: false).Locid).toString()),int.parse(roomcounter.text),double.parse(minimumPrice.text),"${LocationDescription.text}","${Description.text}","${(Provider.of<SelectionDropDownList>(context , listen: false).item).toString()}", Provider.of<Imageprovider>(context,
                     listen: false)
                     .image!);
                 },
                color: const Color.fromARGB(255, 76, 77, 220),
              );
  },
),
            ]),
          ),
        ],
      ),
    );
  }
}
