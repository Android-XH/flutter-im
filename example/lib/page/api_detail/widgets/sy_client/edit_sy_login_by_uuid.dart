import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

import '../../../../component/a_button.dart';
import '../../logic.dart';

class EditSyLoginByUuidWidget extends StatelessWidget {
  const EditSyLoginByUuidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AButton.build(onPressed: () {
      String uuid = "5ecb798a3df84ad181361f777c03687d";
      SyClient.getInstance().loginByUUID(uuid: uuid, callback: SyCallBack(onSuccess: (authInfo) {
        //todo 处理登录成功逻辑
        Get.find<ApiDetailLogic>().setResult(jsonEncode(authInfo.toJson()));
      }, onFail: (code, msg) {
        //todo 处理登录失败逻辑
        Get.find<ApiDetailLogic>().setResult(msg);
      }));
    });
  }
}
