

/// appId : "1234"
/// secret : "1234"
/// autoLogin : true
/// environment:env

class SyOptions {
  String? _appId;
  String? _secret;
  bool? _autoLogin;
  SyEnvironmentEnum? _environment;

  SyOptions(
      {String? appId,
      String? secret,
      bool? autoLogin,
      SyEnvironmentEnum? environment}) {
    _appId = appId;
    _secret = secret;
    _autoLogin = autoLogin;
    _environment = environment;
  }

  SyOptions.fromJson(dynamic json) {
    _appId = json['appId'];
    _secret = json['secret'];
    _autoLogin = json['autoLogin'];
    _environment = json['environment'];
  }

  SyOptions copyWith(
          {String? appId,
          String? secret,
          bool? autoLogin,
          SyEnvironmentEnum? environment}) =>
      SyOptions(
          appId: appId ?? _appId,
          secret: secret ?? _secret,
          autoLogin: autoLogin ?? _autoLogin,
          environment: environment ?? _environment);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appId'] = _appId;
    map['secret'] = _secret;
    map['autoLogin'] = _autoLogin;
    map['environment'] = _environment!.toString().split('.').last;
    return map;
  }

  SyEnvironmentEnum get environment => _environment!;

  set environment(SyEnvironmentEnum value) {
    _environment = value;
  }

  bool get autoLogin => _autoLogin!;

  set autoLogin(bool value) {
    _autoLogin = value;
  }

  String get secret => _secret!;

  set secret(String value) {
    _secret = value;
  }

  String get appId => _appId!;

  set appId(String value) {
    _appId = value;
  }
}

enum SyEnvironmentEnum {
  dev,
  prod;
}
// 添加 toJson() 方法
extension SyEnvironmentEnumExtension on SyEnvironmentEnum {
  String toJson() {
    return toString().split('.').last;
  }
}
