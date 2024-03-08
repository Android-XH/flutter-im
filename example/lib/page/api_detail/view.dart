import 'package:code_preview/code_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sy_im_sdk_example/page/api_detail/widgets/chat/edit_chat_add_lisntener.dart';
import 'package:sy_im_sdk_example/page/api_detail/widgets/sy_client/edit_options_widget.dart';
import 'package:sy_im_sdk_example/page/api_detail/widgets/sy_client/edit_sy_client_init_widget.dart';

import 'package:sy_im_sdk_example/page/api_detail/widgets/sy_client/edit_sy_login_by_token.dart';

import 'logic.dart';

class ApiDetailPage extends StatelessWidget {
  ApiDetailPage({super.key});

  final logic = Get.put(ApiDetailLogic());
  final state = Get.find<ApiDetailLogic>().state;

  @override
  Widget build(BuildContext context) {

    CodePreview.config = CodePreviewConfig(removeParseComment: false);

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
                    visible:
                        Theme.of(context).platform == TargetPlatform.android ||
                            Theme.of(context).platform == TargetPlatform.iOS,
                    child: Column(
                      children: [_buildEdit(), _buildResult()],
                    ))
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
        return const EditSyClientInitWidget();
      case "SyLoginByUserName":
        return const EditSyLoginByToken();
      case "AddMessageListener":
        return const EditChatAddListener();
      default:
        return Container();
        break;
    }
  }

  _buildResult() {
    return Obx(() => Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Card(
            color: Colors.black,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                state.result.value ?? "",
                style: const TextStyle(color: Colors.white),
              ),
            ))));
  }
}
