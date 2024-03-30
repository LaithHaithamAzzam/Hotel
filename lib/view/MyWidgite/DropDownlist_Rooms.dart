import 'package:flutter/material.dart';





const List<String> list = <String>['Hollywood Twin Room','Sweet','Super Delux','Double-double','Studio'];
class DropdownMenuBottom extends StatefulWidget {
  const DropdownMenuBottom({super.key});

  @override
  State<DropdownMenuBottom> createState() => _DropdownMenuBottomState();
}

class _DropdownMenuBottomState extends State<DropdownMenuBottom> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      textStyle: TextStyle(color: Colors.white),
      width: MediaQuery.of(context).size.width-50,
      selectedTrailingIcon: Icon(Icons.arrow_drop_up , color: Colors.white,),
      trailingIcon: Icon(Icons.arrow_drop_down , color: Colors.white,),
      inputDecorationTheme: InputDecorationTheme(
     enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 2))
    ),
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
