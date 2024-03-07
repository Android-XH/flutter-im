
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sy_im_sdk_example/router/app_router_config.dart';

void main() {
  runApp(GetMaterialApp(
    getPages: AppRouterConfig.getPages,
    initialRoute:AppRouterConfig.apiListPage ,
  ));
}


