import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/controller/pick_image_gallery_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUsingGetx extends StatelessWidget {
  ImagePickerUsingGetx({Key? key}) : super(key: key);

  final imageController = Get.put(ImagePickerGalleryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return CircleAvatar(
                  radius: 50,
                  backgroundImage: imageController.imagePath.isNotEmpty
                      ? FileImage(File(imageController.imagePath.toString()))
                      : null,
                );
              }),
              ElevatedButton(onPressed: () {
                imageController.getImages(ImageSource.gallery);
              }, child: const Text("Gallery")),
              ElevatedButton(onPressed: () {
                imageController.getImages(ImageSource.camera);
              }, child: const Text("Camera")),
            ],
          ),
        ),
      ),
    );
  }
}
