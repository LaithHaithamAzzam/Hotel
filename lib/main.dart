import 'package:flutter/material.dart';
import 'package:hotel/HomeScreen/HomeScreen_User.dart';
import 'package:provider/provider.dart';
import 'HomeScreen/MainHomeScreen.dart';
import 'Providers/BottombarProvider.dart';
import 'Providers/MyWallet_Provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BBProvider()),
    ChangeNotifierProvider(create: (_) => WalletProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Plus",
      ),
      home: HomeScreen(),
    );
  }
}
