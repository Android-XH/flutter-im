import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sy_im_sdk_example/bean/ApiBean.dart';
import 'package:sy_im_sdk_example/router/app_router_config.dart';

import 'logic.dart';

class ApiListPage extends StatelessWidget {
  ApiListPage({super.key});

  final logic = Get.put(ApiListLogic());
  final state = Get.find<ApiListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('思语IM-SDK'),
      ),
      body: Obx(() {
        return Column(
          children: [
            ExpansionPanelList.radio(
              expansionCallback: (index, isExpanded) {},
              children: _buildList(),
            )
          ],
        );
      }),
    );
  }

  _buildList() {
    List<ExpansionPanelRadio> dataList = List.empty(growable: true);
    for (var element in state.apiList) {
      dataList.add(ExpansionPanelRadio(
          value: element.title ?? '',
          headerBuilder: (context, isExpanded) {
            return Container(
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: Text(
                "${element.title}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
          body: ListView.separated(
              shrinkWrap: true,
              itemCount: element.children!.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.white,
                  height: 5,
                ); // 自定义分隔线样式
              },
              itemBuilder: (context, index) {
                return _buildItem(element.children![index]);
              })));
    }
    return dataList;
  }

  _buildItem(Children children) {
    return MaterialButton(
      height: 50,
      color: Colors.grey.shade100,
      onPressed: () {
        logic.goDetail(children);
      },
      child: Text(
        children.title ?? '',
        style: const TextStyle(color: Colors.black87, fontSize: 14),
      ),
    );
  }
}
