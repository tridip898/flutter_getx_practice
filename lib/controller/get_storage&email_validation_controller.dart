import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageAndEmailValidationController extends GetxController {
  var storage = GetStorage();
  var emailEditingController = TextEditingController();

  void emailWriteAndValidate() {
    if (GetUtils.isEmail(emailEditingController.text)) {
      storage.write('email', emailEditingController.text);
    } else {
      Get.snackbar("Incorrect Email", "Provide email in valid format",
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.grey);
    }
  }
}
