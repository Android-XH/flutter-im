import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

import '../../../component/a_button.dart';
import '../logic.dart';

class EditSyLoginByToken extends StatelessWidget {
  const EditSyLoginByToken({super.key});

  @override
  Widget build(BuildContext context) {
    return AButton.build(
        title: "试一试",
        onPressed: () {
          String token = "";
          SyClient.getInstance().loginByToken(
              token: token,
              callback: SyCallBack(onSuccess: (authInfo) {
                //todo 处理登录成功逻辑
                Get.find<ApiDetailLogic>()
                    .setResult(jsonEncode(authInfo.toJson()));
              }, onFail: (code, msg) {
                //todo 处理登录失败逻辑
                Get.find<ApiDetailLogic>()
                    .setResult(msg);
              }));
        });
  }
}
