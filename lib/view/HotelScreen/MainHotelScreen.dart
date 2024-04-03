import 'package:flutter/material.dart';
import 'package:hotel/Providers/DarwerProvider.dart';
import 'package:hotel/view/HotelScreen/DrawerHotel.dart';
import 'package:hotel/view/HotelScreen/HotelHomeScreen.dart';
import 'package:provider/provider.dart';

class MainHotelHomeScreen extends StatefulWidget {
  const MainHotelHomeScreen({super.key});

  @override
  State<MainHotelHomeScreen> createState() => _MainHotelHomeScreenState();
}

class _MainHotelHomeScreenState extends State<MainHotelHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if( Provider.of<DraweProvider>(context , listen: false).isopen ==true ){
          Provider.of<DraweProvider>(context , listen: false).opendrawer(false);
        }
      },
      child: WillPopScope(
        onWillPop: () {
          if( Provider.of<DraweProvider>(context , listen: false).isopen ==true ){
            Provider.of<DraweProvider>(context , listen: false).opendrawer(false);
          }
          return Future(() => false);
        },
        child: Consumer<DraweProvider>(
          builder: (context, provider, child) {
            return Stack(
              children: [
                DraweHome(),
                AnimatedContainer(
                  curve: Easing.standard,
                       transform: Matrix4.identity()
                      ..translate(provider.isopen ? -90.0 : 0.0, provider.isopen ? 130.0 : 0.0, 0.0)
                         ..rotateX(provider.isopen ? 0.5 : 0.0)
                      ..scale(provider.isopen ? 0.8 : 1.0),
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: HotelHomeScreen(),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
