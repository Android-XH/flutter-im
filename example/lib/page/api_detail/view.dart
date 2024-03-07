import 'package:code_preview/code_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sy_im_sdk_example/page/api_detail/widgets/edit_options_widget.dart';

import 'logic.dart';

class ApiDetailPage extends StatelessWidget {
  ApiDetailPage({super.key});

  final logic = Get.put(ApiDetailLogic());
  final state = Get.find<ApiDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('思语IM-SDK'),
      ),
      body: GetBuilder<ApiDetailLogic>(
        builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(state.children.title ?? ""),
                ),
                Container(
                  margin: const EdgeInsets.all(30),
                  child: CodePreview(
                    className: state.children.className ?? "",
                    customBuilder: (Widget codeWidget, CustomParam? param) {
                      debugPrint(param?.parseParam['title'].toString());
                      debugPrint(param?.parseParam['content'].toString());
                      debugPrint(param?.parseParam['description'].toString());
                      return codeWidget;
                    },
                  ),
                ),
                Visibility(
                    visible: Theme.of(context).platform==TargetPlatform.android||Theme.of(context).platform==TargetPlatform.iOS,
                    child: Column(children: [
                  _buildEdit(),
                  _buildResult()
                ],))
              ],
            ),
          );
        },
        id: state.dataId,
        initState: (state) {
          logic.getData();
        },
      ),
    );
  }

  _buildEdit() {
    switch (state.children.className) {
      case "CreateSyOptions":
        return const EditOptionsWidget();
      case "SyClientInit":
        return Container();
    }
  }

  _buildResult() {
    return Obx(() => Card(
          color: Colors.black,
          child: SizedBox(
            height: 300,
            child: Center(
              child: Text(
                state.result.value,
                style: TextStyle(color: Colors.white),
              ),
            )
          )
        ));
  }
}
