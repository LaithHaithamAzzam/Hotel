import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/Providers/allHotelProvider.dart';
import 'package:hotel/locale/local.dart';
import 'package:hotel/locale/local_controller.dart';
import 'package:hotel/view/SplashScreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Providers/BottombarProvider.dart';
import 'Providers/CreateHotelProvider.dart';
import 'Providers/DateProvider.dart';
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
    ChangeNotifierProvider(
      create: (context) => BBProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => WalletProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => NotificationProvider()..getdata(),
    ),
    ChangeNotifierProvider(
      create: (context) => DateProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CreateHotelProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LocationProvider(),
    ), ChangeNotifierProvider(
      create: (context) => customerInformationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => Imageprovider(),
    ),
    ChangeNotifierProvider(
      create: (context) => allHotelProvider(),
    ),
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
      getPages: [GetPage(name: "/", page: () => const Splashscreen())],
    );
  }
}
