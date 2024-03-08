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
          syOptions.appId = "7155793691347525633";
          syOptions.secret = "1aa1432b98335fb4033fa6ba54aea0fc436c04061f5c1369f77f72ea30d6240d";
          syOptions.environment = SyEnvironmentEnum.prod;
          SyClient.getInstance().init(syOptions: syOptions);
          Get.find<ApiDetailLogic>().setResult(jsonEncode(syOptions.toJson()));
        });
  }
}
