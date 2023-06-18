import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetViewAndGetWidgetController extends GetxController {
  var count = 0.obs;

  void increment() {
    count.value++;
  }

  decrement() {
    if (count.value <= 0) {
      Get.snackbar("Alert", "The value is ${count.value}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.brown,
          colorText: Colors.white);
    }else{
      count.value--;
    }
  }
}
