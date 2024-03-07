import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SDKInitializer {
  static void init(BuildContext? context) {
    if (context != null) {
      ScreenUtil.init(
        context,
        designSize: const Size(1080, 1920),
      );
    } else {
      print("error context is null");
    }
  }
}
