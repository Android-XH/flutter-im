import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk/sy_client.dart';
import 'package:sy_im_sdk_example/component/a_button.dart';
import 'package:sy_im_sdk_example/page/api_detail/logic.dart';

class EditSyClientInitWidget extends StatelessWidget {
  const EditSyClientInitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AButton.build(
        onPressed: () {
          SyOptions syOptions = SyOptions();
          syOptions.appId = "12345";
          syOptions.secret = "12345";
          syOptions.environment = SyEnvironmentEnum.prod;
          SyClient.getInstance().init(syOptions: syOptions);
          Get.find<ApiDetailLogic>().setResult(jsonEncode(syOptions.toJson()));
        });
  }
}
