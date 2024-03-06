/// code : 200
/// msg : "connect success"
/// type : "CONNECT_SUCCESS"

class ConnectData {
  ConnectData({
    int? code,
    String? msg,
    String? type,
  }) {
    _code = code;
    _msg = msg;
    _type = type;
  }

  ConnectData.fromJson(dynamic json) {
    _code = json['code'];
    _msg = json['msg'];
    _type = json['type'];
  }

  int? _code;
  String? _msg;
  String? _type;

  ConnectData copyWith({
    int? code,
    String? msg,
    String? type,
  }) =>
      ConnectData(
        code: code ?? _code,
        msg: msg ?? _msg,
        type: type ?? _type,
      );

  int? get code => _code;

  String? get msg => _msg;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['msg'] = _msg;
    map['type'] = _type;
    return map;
  }
}
