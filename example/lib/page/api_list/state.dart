import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sy_im_sdk_example/bean/ApiBean.dart';

class ApiListState {
  RxList<ApiBean> apiList = RxList();
  String dataId = "apiId";

  ApiListState() {
    ///Initialize variables
    getData();
  }

  void getData() async {
    String jsonString = await rootBundle.loadString('assets/data/data.json');
    List<dynamic> list = jsonDecode(jsonString);
    apiList.addAll(list.map((item) => ApiBean.fromJson(item)).toList());
    apiList.refresh();
  }
}
