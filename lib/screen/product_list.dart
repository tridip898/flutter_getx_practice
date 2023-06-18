import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/controller/product_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  final _controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("API call and Display"),
        ),
          body: Obx(() {
            if(_controller.productList.isNotEmpty){
              return ListView.builder(
                  itemCount: _controller.productList.length,
                  itemBuilder: (context, index) {
                    var product = _controller.productList[index];
                    return ListTile(
                      selectedTileColor: Colors.pinkAccent,
                      leading: CircleAvatar(
                          child: Text(product.brand)
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.category),
                      trailing: Text("${product.priceSign} ${product.price}"),
                    );
                  });
            }else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("Please wait")
                  ],
                ),
              );
            }
          })
      ),
    );
  }
}
