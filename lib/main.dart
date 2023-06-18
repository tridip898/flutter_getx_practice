import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_practice/screen/get_storage&email_validation.dart';
import 'package:flutter_getx_practice/screen/getview_getwidget.dart';
import 'package:flutter_getx_practice/screen/home_page.dart';
import 'package:flutter_getx_practice/screen/next_screen.dart';
import 'package:flutter_getx_practice/screen/pick_image_gallery_getx.dart';
import 'package:flutter_getx_practice/screen/product_list.dart';
import 'package:flutter_getx_practice/screen/text_extract_from_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';


Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/text-extract',
        getPages: [
          GetPage(name: '/', page: () => HomePage()),
          GetPage(
              name: '/next',
              page: () => const NextScreen(),
              transition: Transition.leftToRight),
          GetPage(name: '/product-page', page: () => ProductScreen()),
          GetPage(
              name: '/get-storage', page: () => GetStorageAndEmailValidation()),
          GetPage(name: '/getview', page: () => GetViewAndGetWidget()),
          GetPage(name: '/image_picker', page: () => ImagePickerUsingGetx()),
          GetPage(name: '/text-extract', page: () => TextExtractFromImage()),
        ],
      );
    });
  }
}
