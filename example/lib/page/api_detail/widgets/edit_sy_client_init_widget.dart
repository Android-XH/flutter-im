import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk_example/page/api_detail/logic.dart';

import '../state.dart';

class EditOptionsWidget extends StatelessWidget {
  const EditOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text("试一试"),
        onPressed: () {
          SyOptions syOptions = SyOptions();
          syOptions.appId = "12345";
          syOptions.secret = "12345";
          Get.find<ApiDetailLogic>()
              .setResult(jsonEncode(syOptions.toString()));
        });
  }
}
