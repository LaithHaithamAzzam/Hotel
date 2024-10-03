import 'package:flutter/material.dart';
import 'package:hotel/view/HomeScreen/Favorite.dart';
import 'package:hotel/view/HomeScreen/HomeScreen_User.dart';
import 'package:hotel/view/Wallet/MyWallet.dart';
import 'package:provider/provider.dart';
import '../../Providers/BottombarProvider.dart';
import '../ProfileScreens/MyProfile.dart';
import 'BottomBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Bottombar(),
        body: Consumer<BBProvider>(
          builder: (context, provider, child) {
            return provider.currentIndex == 0
                ? UserHomeScreen()
                : provider.currentIndex == 1
                    ? FavoriteScreen()
                    : provider.currentIndex == 2
                        ? MyProf()
                        : Mywallet();
          },
        ));
  }
}
