import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel/Providers/SelectRoomsOfferProvider.dart';
import 'package:provider/provider.dart';

Selectdate(BuildContext context) {
  DateTime? startDate;
  DateTime? endDate;
  showCustomDateRangePicker(
    context,
    dismissible: true,
    minimumDate: DateTime.now(),
    maximumDate: DateTime(DateTime.now().year + 10),
    endDate:  Provider.of<SelectRoomsOfferProvider>(context , listen: false).Enddate,
    startDate:  Provider.of<SelectRoomsOfferProvider>(context , listen: false).Startdate,
    backgroundColor: Colors.white,
    primaryColor: Color(0xff3D36A4),
    onApplyClick: (start, end) {
      startDate = DateTime(start.year,start.month,start.day);
      endDate = DateTime(end.year,end.month,end.day);
      Provider.of<SelectRoomsOfferProvider>(context , listen: false).SetDate(startDate, endDate);
    },
    onCancelClick: () {

    },
  );
}
