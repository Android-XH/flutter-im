import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import '../../bean/ApiBean.dart';
import 'logic.dart';

class MakeDownPage extends StatelessWidget {
  MakeDownPage({super.key});

  final logic = Get.put(MakeDownLogic());

  @override
  Widget build(BuildContext context) {
    Map<String, String?> parameters = Get.parameters;
    var json = parameters["children"];
    var jsonStr = jsonDecode(json!);
    var children = Children.fromJson(jsonStr);

    return Container(
        margin: const EdgeInsets.all(30),
        child: FutureBuilder(
          future: rootBundle.loadString(children.className ?? ""),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Markdown(data: snapshot.data);
            } else {
              return const Text("加载中...");
            }
          },
        ));
  }
}
