import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/controller/getview_getwidget_controller.dart';
import 'package:get/get.dart';

class GetViewAndGetWidget extends GetView<GetViewAndGetWidgetController>{
  
  @override
  Widget build(BuildContext context) {
    Get.put(GetViewAndGetWidgetController());
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Text("The number is ${controller.count}");
              }),
              ElevatedButton(onPressed: ()=>controller.increment(), child: const Text("Increment")),
              ElevatedButton(onPressed: ()=>controller.decrement(), child: const Text("Decrement")),
            ],
          ),
        ),
      ),
    );
  }
}