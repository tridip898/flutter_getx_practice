import 'dart:convert';

import 'package:flutter_getx_practice/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProductController extends GetxController{

  Future<List<ProductModel>>? fetchDatas;
  var isLoading=true.obs;
  var productList=<ProductModel>[].obs;

  @override
  void onInit() {
    fetchDatas=fetchData();
    super.onInit();
  }

  Future<List<ProductModel>> fetchData() async{
    try{
      isLoading(true);
      var response= await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));
      if(response.statusCode==200){
        var products=jsonDecode(response.body);
        productList.value=(products as List).map((data) => ProductModel.fromJson(data)).toList();
        return productList;
      }else{
        throw Exception('Failed to load album');
      }
    }on Exception catch(e) {
      isLoading(false);
      return [];
    }

  }
}