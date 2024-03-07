import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk_example/component/a_button.dart';
import 'package:sy_im_sdk_example/page/api_detail/logic.dart';


class EditOptionsWidget extends StatelessWidget {
  const EditOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15),child: Column(
      children: [
        //AppID输入
        TextField(
          decoration: const InputDecoration(hintText: "请输入AppID"),
          onChanged: (s){

          },
        ),
        //AppSecret输入
        TextField(
          decoration: const InputDecoration(hintText: "请输入AppSecret"),
          onChanged: (s){

          },
        ),
        Container(height: 30,),
        AButton.build(
            title: "试一试",
            onPressed: () {
              SyOptions syOptions = SyOptions();
              syOptions.appId = "1234";
              syOptions.secret = "1234";
              syOptions.environment = SyEnvironmentEnum.prod;
              String result = jsonEncode(syOptions.toJson());
              Get.find<ApiDetailLogic>().setResult(result);
            })
      ],
    ),);
  }
}
