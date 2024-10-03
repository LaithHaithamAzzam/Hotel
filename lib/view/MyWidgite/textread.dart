import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: new ConstrainedBox(
              constraints: widget.isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 50.0),
              child: GestureDetector(
                onTap:  () => setState(() => widget.isExpanded = false),
                child: new Text(
                  widget.text,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ))),
      widget.isExpanded
          ? new ConstrainedBox(constraints: new BoxConstraints())
          : Row(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new TextButton(
                style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.white),foregroundColor: MaterialStatePropertyAll(Color(0xff4C4DDC))),
              child:  Text("Read More ...".tr),
              onPressed: () => setState(() => widget.isExpanded = true)),
            ],
          )
    ]);
  }
}