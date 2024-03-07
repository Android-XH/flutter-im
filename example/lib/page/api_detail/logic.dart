import 'package:get/get.dart';

import 'state.dart';

class ApiDetailLogic extends GetxController {
  final ApiDetailState state = ApiDetailState();

  getData() {}

  setResult(String result) {
    state.result.value = result;
  }
}
