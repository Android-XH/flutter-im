import 'package:sy_im_sdk/config/sy_options.dart';


class CreateSyOptions {
  SyOptions _createSyOptions() {
    SyOptions syOptions = SyOptions();
    syOptions.appId = "您的AppID";
    syOptions.secret = "您的secret";
    return syOptions;
  }
}
