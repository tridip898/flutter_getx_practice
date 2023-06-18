import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TextExtractFromImageController extends GetxController{
  RxString extractedText = ''.obs;
  RxString imagePath=''.obs;

  void getImage(ImageSource imageSource) async{
    final ImagePicker picker=ImagePicker();
    final pickedImage=await picker.pickImage(source: imageSource);
    if(pickedImage!=null){
      imagePath.value=pickedImage.path.toString();
    }else{
      Get.snackbar("Error", "No image is selected",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}