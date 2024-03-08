import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sy_im_sdk_example/bean/ApiBean.dart';
import 'package:sy_im_sdk_example/router/app_router_config.dart';

import 'state.dart';

class ApiListLogic extends GetxController {
  final ApiListState state = ApiListState();

  getData() async {
    state.getData();
  }

  goDetail(Children children) {
    Map<String, String> params = Map();
    params.putIfAbsent("children", () => jsonEncode(children.toJson()));
    if (children.className!.endsWith(".md")) {
      Get.toNamed(AppRouterConfig.makeDownPage, parameters: params);
    } else {
      Get.toNamed(AppRouterConfig.apiDetailPage, parameters: params);
    }
  }
}
