import 'package:flutter/material.dart';

//const List<String> list = <String>['Hollywood Twin Room','Sweet','Super Delux','Double-double','Studio'];
class DropdownMenuBottomoffers extends StatefulWidget {
  const DropdownMenuBottomoffers({super.key});

  @override
  State<DropdownMenuBottomoffers> createState() =>
      _DropdownMenuBottomoffersState();
}

class _DropdownMenuBottomoffersState extends State<DropdownMenuBottomoffers> {
  @override
  Widget build(BuildContext context) {
    List<String> list = ['studio', 'super delux'];
// Provider.of<RoomTypesProvider>(context,listen: true).data!.toList();
    TextEditingController c = TextEditingController(text: "${list.first}");
    print("$list");
    String dropdownValue = 'Studio';
    //Provider.of<RoomTypesProvider>(context,listen: true).data![0];
    return DropdownMenu<String>(
      textStyle: TextStyle(color: Colors.white),
      width: MediaQuery.of(context).size.width - 50,
      selectedTrailingIcon: Icon(
        Icons.arrow_drop_up,
        color: Colors.white,
      ),
      trailingIcon: Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2))),
      controller: c,
      onSelected: (String? value) async {
        // This is called when the user selects an item.
        //  await  Provider.of<RoomTypesProvider>(context,listen: false).setvalue(value.toString());
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
