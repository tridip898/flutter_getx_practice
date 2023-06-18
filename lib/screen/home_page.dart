import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/controller/controller.dart';
import 'package:flutter_getx_practice/screen/next_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = Get.put(ControllerGet());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Getx"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //     onPressed: _controller.showSnackbar,
              //     child: const Text("SnackBar")),
              // const SizedBox(
              //   height: 20,
              // ),
              // ElevatedButton(
              //     onPressed: _controller.showDialog,
              //     child: const Text("Show Dialog")),
              // const SizedBox(
              //   height: 20,
              // ),
              // ElevatedButton(
              //     onPressed: _controller.showBottomSheet,
              //     child: const Text("Bottom Sheet")),
              // const SizedBox(
              //   height: 20,
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       Get.toNamed('/next',arguments: "This is from home");
              //     },
              //     child: const Text("Go to Next Screen"))
              Obx(() {
                return Text("Count Value is : ${_controller.count}",
                  style: const TextStyle(fontSize: 24),);
              }),
              ElevatedButton(onPressed: _controller.increment,
                  child: const Text("Increment")),
              ElevatedButton(onPressed: _controller.decrement,
                  child: const Text("Decrement")),

              GetBuilder<ControllerGet>(
                  id: "changeName",
                  builder: (controller){
                return Text("The name is ${_controller.name}");
              }),
              GetBuilder<ControllerGet>(builder: (controller){
                return Text("The name is ${_controller.name}");
              }),
              ElevatedButton(onPressed: () => _controller.changeName(),
                  child: const Text("Change name"))
            ],
          ),
        ),
      ),
    );
  }
}
