import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Hotel/Detail_Hotel_User.dart';
import '../Providers/BottombarProvider.dart';
import 'BottomBar.dart';
import 'MainHomeScreen.dart';



class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if(Provider.of<BBProvider>(context , listen: false).currentIndex==1){
            Provider.of<BBProvider>(context , listen: false).setcurrentindex(0);
          }else
          {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
          }
          return Future(() => false);
        },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(right: 20),
          child: ListView.builder(itemBuilder: (context, index) {
            return  Stack(
                alignment: Alignment.topRight,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detile_Hotel(Herotag:"$index"),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20,top: 20 , bottom: 10 ),
                      width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 0,
                                offset: Offset(0, 4)
                                ,blurRadius: 6
                            )
                          ]
                      ),

                      child: Column(

                        children: [
                          Hero(
                            tag:"Hotel${index}",
                            child: Container(
                              width:  MediaQuery.of(context).size.width,
                              height: 209,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                  image: DecorationImage(image: NetworkImage(
                                    "https://www.shutterstock.com/image-illustration/hotel-sign-stars-3d-illustration-260nw-197337320.jpg"
                                    ,
                                  ),fit: BoxFit.cover,)
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0 , right: 8.0 , top: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Text("The Burj Alreem Hotel", style: TextStyle(fontWeight: FontWeight.bold))),
                                      Icon(Icons.star , color: Color(0xffFFD33C),) ,
                                      Text("5.0", style: TextStyle(fontWeight: FontWeight.bold))
                                    ],
                                  ) ,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Swidaa , Qanawat" , style: TextStyle(color: Color(0xff878787), fontWeight: FontWeight.bold),)
                                    ],
                                  ) ,
                                  Row(
                                    children: [
                                      Text("SP 180.000" , style: TextStyle(color: Color(0xff4C4DDC) , fontWeight: FontWeight.bold),),
                                      Text("/night" , style: TextStyle(color: Color(0xff878787), fontWeight: FontWeight.bold),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0 , right: 5.0),
                    child: Hero(
                      tag:"Fev${index}",
                      child: IconButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            iconSize: MaterialStatePropertyAll(25),
                            minimumSize: MaterialStatePropertyAll(Size(40, 40)),
                            maximumSize:  MaterialStatePropertyAll(Size(40, 40)),
                            backgroundColor: MaterialStatePropertyAll(Colors.white),
                            iconColor: MaterialStatePropertyAll(Color(0xff4C4DDC)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xffEDEDED), width: 1.5),
                                borderRadius: BorderRadius.all(Radius.circular(40))))),
                        icon: Icon(
                          Icons.favorite,
                        ),
                      ),
                    ),
                  ),
                ],
            );
          },
          itemCount: 7,
          ),
        )
      ),
    );
  }
}
