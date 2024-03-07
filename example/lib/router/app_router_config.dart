import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sy_im_sdk_example/page/api_detail/view.dart';
import 'package:sy_im_sdk_example/page/api_list/view.dart';



class AppRouterConfig {
  static const String apiListPage = "/apiListPage";
  static const String apiDetailPage = "/apiDetailPage";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: apiListPage, page: () => ApiListPage()),
    GetPage(name: AppRouterConfig.apiDetailPage, page: () => ApiDetailPage()),
  ];
}
