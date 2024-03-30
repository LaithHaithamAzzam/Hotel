import 'package:flutter/material.dart';
import 'package:hotel/Providers/BottombarProvider.dart';
import 'package:hotel/Providers/customerInformationProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeScreen/MainHomeScreen.dart';
import '../SplashScreen/LoginAndRegister.dart';

class MyProf extends StatelessWidget {
  const MyProf({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if(Provider.of<BBProvider>(context , listen: false).currentIndex==2){
          Provider.of<BBProvider>(context , listen: false).setcurrentindex(0);
        }else{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
        }
        return Future(() => false);
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width:  MediaQuery.of(context).size.width - 30,
                  height:  MediaQuery.of(context).size.width * .50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(image: NetworkImage(
                        "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTEwL3Jhd3BpeGVsX29mZmljZV8zNV9oYXBweV9ibGFja193b21hbl9zbWlsZXNfYXRfY2FtZXJhX2lzb2xhdGVkX182Nzc5ZmU0OC1lMmJiLTQxMmYtOGE3OC1jNzQ2ZmFmNjQxM2VfMS5qcGc.jpg"                      ,
                      ),fit: BoxFit.cover,)
                  ),
                ),
               Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 20.0),
                     child: Text("My Profile" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 14),),
                   )
                   ,
                   Container(
                     margin: EdgeInsets.all(7.0),
                     width: MediaQuery.of(context).size.width - 40,
                     decoration: BoxDecoration(
                         color: Color(0xff4C4DDC)
                         ,borderRadius: BorderRadius.all(Radius.circular(6))
                     ),
                     child: TextFormField(
                       textAlign: TextAlign.center,
                       initialValue: Provider.of<customerInformationProvider>(context,listen: true).name,
                       style: TextStyle(color: Colors.white),
                       decoration: InputDecoration(
                           border: OutlineInputBorder(borderSide: BorderSide.none),
                           enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)
                       ),
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.all(7.0),
                     width: MediaQuery.of(context).size.width - 40,
                     decoration: BoxDecoration(
                         color: Color(0xff4C4DDC)
                         ,borderRadius: BorderRadius.all(Radius.circular(6))
                     ),
                     child: TextFormField(
                       textAlign: TextAlign.center,
                       initialValue: Provider.of<customerInformationProvider>(context,listen: true).username,
                       style: TextStyle(color: Colors.white),
                       decoration: InputDecoration(
                           border: OutlineInputBorder(borderSide: BorderSide.none),
                           enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)
                       ),
                     ),
                   ),

                   Text("Settings" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 14),)
                   ,Padding(
                     padding: const EdgeInsets.only(top: 10.0 , bottom: 10.0),
                     child: TextButton(
                       onPressed: (){},
                       child: Text("Language"),
                       style: ButtonStyle(
                           foregroundColor: MaterialStatePropertyAll(Colors.white),
                           backgroundColor:MaterialStatePropertyAll(Color(0xff4C4DDC)),
                           minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * .9 , 60)),
                           shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 10.0),
                     child: TextButton(
                       onPressed: (){},
                       child: Text("Theme"),
                       style: ButtonStyle(
                           foregroundColor: MaterialStatePropertyAll(Colors.white),
                           backgroundColor:MaterialStatePropertyAll(Color(0xff4C4DDC)),
                           minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * .9 , 60)),
                           shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                       ),
                     ),
                   ),
                   TextButton(
                     onPressed: ()async{
                       SharedPreferences prefs = await SharedPreferences.getInstance();
                       prefs.clear();
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => loginAndRegisterScreen(),));
                     },
                     child: Text("Log out"),
                     style: ButtonStyle(
                       overlayColor: MaterialStatePropertyAll(Color(0xffe57b7b)),
                         foregroundColor: MaterialStatePropertyAll(Colors.white),
                         backgroundColor:MaterialStatePropertyAll(Color(0xffE26A6A)),
                         minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * .9 , 60)),
                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
                     ),
                   ),
                 ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
