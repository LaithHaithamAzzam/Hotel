import 'package:flutter/cupertino.dart';
import 'dart:math';
class WalletProvider extends ChangeNotifier{

  double mony = 80000;
  ChargeWallet(double Mon){
    mony = (mony + Mon).roundToDouble();
    notifyListeners();
  }
  SendMony(double Mon){
    mony = (mony - Mon).roundToDouble();
    notifyListeners();
  }
}