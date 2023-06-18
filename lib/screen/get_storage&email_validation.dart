import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/controller/get_storage&email_validation_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageAndEmailValidation extends StatelessWidget {

  var storage =GetStorage();
  var emailEditingController=TextEditingController();
  final _controller=Get.put(GetStorageAndEmailValidationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Get Storage and Email Validation",style: TextStyle(fontSize: 14.sp),),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  controller: _controller.emailEditingController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.email_outlined)
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                _controller.emailWriteAndValidate();
              }, child: const Text("Write")),
              ElevatedButton(onPressed: (){
                print("The email is ${_controller.storage.read('email')}");
              }, child: const Text("Read")),
            ],
          ),
        ),
      ),
    );
  }
}
