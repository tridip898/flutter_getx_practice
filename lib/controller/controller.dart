import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerGet extends GetxController {
  var count = 0.obs;
  var name="Tridip";

  showSnackbar() {
    Get.snackbar(
      "Title from getxController", "Message from GetxController",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      animationDuration: const Duration(milliseconds: 1500),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      backgroundGradient: const LinearGradient(
          colors: [Colors.pink, Colors.orangeAccent, Colors.teal]),
      boxShadows: [const BoxShadow(color: Colors.grey, blurRadius: 10)],
      //icon: const Icon(Icons.send),
      mainButton: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "Ok",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  showDialog() {
    Get.defaultDialog(
        title: "Are you 18+?",
        content: const Text(
            "This site is only available for the people who are 18 or above"),
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        textConfirm: "Ok",
        onConfirm: () {},
        confirmTextColor: Colors.white,
        onCancel: () {},
        textCancel: "No",
        cancelTextColor: Colors.white,
        radius: 10,
        backgroundColor: Colors.teal,
        buttonColor: Colors.green);
  }

  showBottomSheet() {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Wrap(
            children: [
              ListTile(
                title: const Text("Light Theme"),
                leading: const Icon(Icons.wb_sunny_rounded),
                onTap: () => {Get.changeTheme(ThemeData.light())},
              ),
              ListTile(
                title: const Text("Dark Theme"),
                leading: const Icon(Icons.dark_mode),
                onTap: () => {Get.changeTheme(ThemeData.dark())},
              ),
            ],
          ),
        ),
        isDismissible: true);
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value <= 0) {
      count.value = 0;
      Get.snackbar("Alert", "The value is ${count.value}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.teal,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white);
    } else {
      count.value--;
    }
  }

  void changeName(){
    name="Tridip Bhowmik";
    update(['changeName']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
