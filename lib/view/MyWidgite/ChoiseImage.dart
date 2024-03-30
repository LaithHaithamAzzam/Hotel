import 'package:flutter/material.dart';
import 'package:hotel/Providers/ImageProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';



 choisimage(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
   var image = await picker.pickImage(source: ImageSource.gallery);
  if (image!.path.isNotEmpty) {
    Provider.of<Imageprovider>(context,listen: false).Addimage(File(image!.path));
  }
}