import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/controller/text_extract_from_image_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TextExtractFromImage extends StatelessWidget {
  TextExtractFromImage({Key? key}) : super(key: key);

  final TextExtractFromImageController textExtractFromImageController =
  TextExtractFromImageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Text Extract"),
        ),
        body: Obx(() {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 60.w,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black12, width: 1),
                      image: DecorationImage(
                          image: FileImage(File(textExtractFromImageController
                              .imagePath.toString())),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          textExtractFromImageController
                              .getImage(ImageSource.gallery);
                        },
                        child: const Text("Pick Image"))
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
