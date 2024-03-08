import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';
import 'package:sy_im_sdk_example/component/a_button.dart';

import '../../logic.dart';

class EditChatAddListener extends StatelessWidget {
  const EditChatAddListener({super.key});

  @override
  Widget build(BuildContext context) {
    return AButton.build(onPressed: () {
      Get.find<ApiDetailLogic>().setResult("已添加消息监听");
      SyClient.getInstance().chatManager().addMessageListener(
              OnMessageListener(onMessage: (List<SyMessage> syMessage) {
            Get.find<ApiDetailLogic>()
                .addResult(syMessage.map((e) => e.toJson()).toString());
          }, onCmdMsg: (List<SyMessage> syMessage) {
            Get.find<ApiDetailLogic>()
                .addResult(syMessage.map((e) => e.toJson()).toString());
          }, onStatusChange: (List<SyMessage> syMessage) {
            Get.find<ApiDetailLogic>()
                .addResult(syMessage.map((e) => e.toJson()).toString());
          }));
    });
  }
}
