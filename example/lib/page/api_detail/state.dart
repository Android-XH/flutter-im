import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:sy_im_sdk_example/bean/ApiBean.dart';

class ApiDetailState {
  String dataId = "detailId";
  late Children children;

  RxString result = "".obs;

  ApiDetailState() {
    Map<String, String?> parameters = Get.parameters;
    var json = parameters["children"];
    var jsonStr = jsonDecode(json!);
    children = Children.fromJson(jsonStr);
    print("children:${children.className}");
  }


}
