import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sy_im_sdk_example/router/app_router_config.dart';
import 'package:sy_im_sdk_example/util/sdk_initializer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRouterConfig.getPages,
      initialRoute: AppRouterConfig.example,
      onInit: () {
        SDKInitializer.init(context);
      },
    );
  }
}
