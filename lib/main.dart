import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/AllFavHotelsProvider.dart';
import 'package:hotel/Providers/DarwerProvider.dart';
import 'package:hotel/Providers/HotelRoomsProvider.dart';
import 'package:hotel/Providers/MyOffersProvider.dart';
import 'package:hotel/Providers/RoomDertailProvider.dart';
import 'package:hotel/Providers/SelectRoomsOfferProvider.dart';
import 'package:hotel/Providers/SelectRoomsProvider.dart';
import 'package:hotel/Providers/SelectionDropDownList.dart';
import 'package:hotel/Providers/SerchProvider.dart';
import 'package:hotel/Providers/SetRateProvider.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/Providers/roomTypeCounterProvider.dart';
import 'package:hotel/Providers/roomTypesProvider.dart';
import 'package:hotel/locale/local.dart';
import 'package:hotel/locale/local_controller.dart';
import 'package:hotel/view/SplashScreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/BottombarProvider.dart';
import 'Providers/CreateHotelProvider.dart';
import 'Providers/DateProvider.dart';
import 'Providers/HotelHomeScreen_Provider.dart';
import 'Providers/ImageProvider.dart';
import 'Providers/LocationsProvider.dart';
import 'Providers/MyWallet_Provider.dart';
import 'Providers/NotificationProvider.dart';
import 'Providers/customerInformationProvider.dart';

SharedPreferences? lang;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  lang = await SharedPreferences.getInstance();
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BBProvider(),),
    ChangeNotifierProvider(create: (context) => WalletProvider(),),
    ChangeNotifierProvider(create: (context) => NotificationProvider()..getdata(),),
    ChangeNotifierProvider(create: (context) => DateProvider(),),
    ChangeNotifierProvider(create: (context) => CreateHotelProvider(),),
    ChangeNotifierProvider(create: (context) => LocationProvider(),),
    ChangeNotifierProvider(create: (context) => customerInformationProvider(),),
    ChangeNotifierProvider(create: (context) => Imageprovider(),),
    ChangeNotifierProvider(create: (context) => allHotelProvider(),),
    ChangeNotifierProvider(create: (context) => HotelRoomsProvider(),),
    ChangeNotifierProvider(create: (context) => RoomTypesProvider()),
    ChangeNotifierProvider(create: (context) => roomTypeCounterProvider()),
    ChangeNotifierProvider(create: (context) => AllFavHotelsProvider()),
    ChangeNotifierProvider(create: (context) => SerchProvider()),
    ChangeNotifierProvider(create: (context) => HotelHomeScreenProvider()),
    ChangeNotifierProvider(create: (context) => DraweProvider()),
    ChangeNotifierProvider(create: (context) => SelectRoomsProvider()),
    ChangeNotifierProvider(create: (context) => SelectRoomsOfferProvider()),
    ChangeNotifierProvider(create: (context) => MyOffersProvider()),
    ChangeNotifierProvider(create: (context) => SelectionDropDownList()),
    ChangeNotifierProvider(create: (context) => RoomDertailProvider()),
    ChangeNotifierProvider(create: (context) => SetRateProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  localeController loc = Get.put(localeController(), permanent: true);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    localeController loc = Get.put(localeController(), permanent: true);
    return GetMaterialApp(
      translations: MyLocal(),
      locale: loc.init,
      getPages: [GetPage(name: "/", page: () =>  Splashscreen())],
    );
  }
}
