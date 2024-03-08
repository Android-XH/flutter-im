import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sy_im_sdk_example/page/api_detail/view.dart';
import 'package:sy_im_sdk_example/page/api_list/view.dart';
import 'package:sy_im_sdk_example/page/make_down/view.dart';
import 'package:sy_im_sdk_example/page/my_example_app.dart';

class AppRouterConfig {
  static const String example = "/example";
  static const String apiListPage = "/apiListPage";
  static const String apiDetailPage = "/apiDetailPage";
  static const String makeDownPage = "/makeDownPage";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: example, page: () => const MyExampleApp()),
    GetPage(name: apiListPage, page: () => ApiListPage()),
    GetPage(name: AppRouterConfig.apiDetailPage, page: () => ApiDetailPage()),
    GetPage(name: AppRouterConfig.makeDownPage, page: () => MakeDownPage()),
  ];
}
