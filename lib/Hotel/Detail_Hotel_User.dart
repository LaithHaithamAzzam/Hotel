import 'package:flutter/material.dart';

import '../MyWidgite/BottomSheet.dart';
import '../MyWidgite/textread.dart';
class Detile_Hotel extends StatelessWidget {
   Detile_Hotel({this.Herotag , super.key});
   String? Herotag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8.0 , right: 8.0 , bottom: 8.0),
        child: Hero(
          tag: "BookBTN",
          child: TextButton(
            onPressed: () =>showModalBottomSheet(context: context, builder: (context) => Bottomsheet(),),
            child: Text("Booking Now"),
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor:MaterialStatePropertyAll(Color(0xff4C4DDC)),
              minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-10 , 60)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))))
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        actions: [
          Container(
            padding: EdgeInsets.only(left: 5,right: 5),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag:"notification-icon",
                child: IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(40, 40)),
                      iconColor: MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xffEDEDED), width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(6))))),
                  icon: Icon(
                    Icons.notifications,
                  ),
                ),
              ),
              Text("Detile" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
              IconButton(
                onPressed: () {},
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(40, 40)),
                    iconColor: MaterialStatePropertyAll(Colors.black),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xffEDEDED), width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(6))))),
                icon: Icon(
                  Icons.more_horiz_rounded,
                ),
              ),
            ],
          )) ,
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Hero(
                        tag:"Hotel${Herotag}",
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.96,
                          height: MediaQuery.of(context).size.width/1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                              image: DecorationImage(image: NetworkImage(
                                "https://www.shutterstock.com/image-illustration/hotel-sign-stars-3d-illustration-260nw-197337320.jpg"
                                ,
                              ),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                      ),
                      Hero(
                        tag:"Fev${Herotag}",
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
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,

                  child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 5 , top: 5 ),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5FF),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5 , right: 5 , left: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                         Icon(Icons.star,color: Color(0xffFFD33C)),
                         Padding(
                           padding:EdgeInsets.only(left: 8.0),
                           child: Text("5.0", style: TextStyle(fontWeight: FontWeight.bold)),
                         )
                          ],
                        ),
                      ),
                    );
                  },itemCount: 10),
                ) ,
             Container(
               width: MediaQuery.of(context).size.width-20,
               child: Padding(
                 padding: const EdgeInsets.only(top: 8.0),
                 child: SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                     children: [
                       Text("The Burj Alreem Hotel" , style: TextStyle(fontWeight: FontWeight.bold)),
                       Padding(
                         padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * .15),
                         child: Row(
                           children: [
                             Text("SP 180.000" , style: TextStyle(color: Color(0xff4C4DDC),fontWeight: FontWeight.bold),),
                             Text("/night" , style: TextStyle(color: Color(0xff878787),fontWeight: FontWeight.bold),)
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
                Padding(
                  padding: const EdgeInsets.only(top: 7 , bottom: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_rounded, color: Color(0xff4C4DDC),size: 23,),
                      Text("Swaidaa - Qanawat" , style: TextStyle(color: Color(0xff878787),fontSize: 13),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0 , bottom: 8.0),
                  child: Row(
                    children: [
                      Text("Description" , style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                    child: ExpandableText("The Burj Alreem Hotel, Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla "),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0 , bottom: 10.0),
                  child: Row(
                    children: [
                      Text("Preview" , style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: GridView.builder(itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        image: DecorationImage(image: NetworkImage(
                        "https://cf.bstatic.com/xdata/images/hotel/max1024x768/491829280.jpg?k=8e5ebf81dcc4ae3913dd285be94ba05866559b27c503912b8e1f2c7239fccc2c&o=&hp=1"                          ,
                        ),fit: BoxFit.cover)
                      ),
                    );
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10
                  ),
                    itemCount: 8,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

