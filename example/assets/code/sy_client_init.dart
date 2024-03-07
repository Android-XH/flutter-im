import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk/sy_client.dart';

class SyClientInit {
  void _init() {
    SyOptions syOptions = SyOptions();
    syOptions.appId = "您的AppID";
    syOptions.secret = "您的secret";
    syOptions.environment=SyEnvironmentEnum.prod;
    SyClient.getInstance().init(syOptions: syOptions);
  }
}
