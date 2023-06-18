import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerGalleryController extends GetxController {
  RxString imagePath = "".obs;

  void getImages(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: imageSource);

    if (pickedImage != null) {
      imagePath.value = pickedImage.path.toString();

    } else {
      Get.snackbar("Error", "No image is selected",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  ///this for normal image picker without getx
  // XFile? imageFile;

  // void getImage() async{
  //   final pickedImage= await ImagePicker().pickImage(source: ImageSource.camera);
  //
  //   if(pickedImage!=null){
  //     imageFile=File(pickedImage.path) as XFile?;
  //   }
  // }
}

