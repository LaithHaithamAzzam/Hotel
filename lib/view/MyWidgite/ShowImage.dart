import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
   ShowImage({required this.URL ,required this.HERO , super.key});
   String? URL;
   String? HERO;
  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "${widget.HERO}",
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(
                        Radius.circular(1)
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${widget.URL}"
                      ),

                    )),
              ),
            ),
          ],
        ),
      )
    );
  }
}
