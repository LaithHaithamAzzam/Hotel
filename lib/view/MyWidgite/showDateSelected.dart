import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/DateProvider.dart';

Selectdate(BuildContext context , int Sallary){
  DateTime? startDate;
  DateTime? endDate;
  showCustomDateRangePicker(
    context,
    dismissible: true,
    minimumDate: DateTime.now(),
    maximumDate: DateTime(DateTime.now().year+10),
    endDate: endDate,
    startDate: startDate,
    backgroundColor: Colors.white,
    primaryColor: Color(0xff3D36A4),
    onApplyClick: (start, end) {
      startDate= DateTime(start.year,start.month,start.day);
      endDate= DateTime(end.year,end.month,end.day);
      print(start.subtract(Duration()));
      print(DateTime(end.year,end.month,end.day));
     String fulldate = "${end.difference(start).inDays + 1} Days";
      Provider.of<DateProvider>(context , listen: false).Changedate(fulldate);
      int sal = (end.difference(start).inDays + 1)*Sallary;
      Provider.of<DateProvider>(context , listen: false).ChangeSallary(double.parse("$sal"));
      Provider.of<DateProvider>(context,listen: false).setDate(startDate.toString(), endDate.toString());
    },
    onCancelClick: () {

    },
  );
}