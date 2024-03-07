/// chatUser : {"avatar":"https://xhyimage.oss-cn-shenzhen.aliyuncs.com/system/sex/sex1.png","birthday":"0","email":null,"extension":"{\"userId\":907885191889035264}","gender":"1","label":null,"mobile":"13333333333","nickName":"笔直的乡村","remark":null,"sessionId":null,"status":0,"type":0,"userId":"05b3dcc21d934283b2c493b8fbf88a7b"}
/// lastLoginUser : true
/// token : "55fa75a3f2c60fab04fb28eb09477e91"
/// userId : "05b3dcc21d934283b2c493b8fbf88a7b"

class AuthInfo {
  AuthInfo({
      ChatUser? chatUser, 
      bool? lastLoginUser, 
      String? token, 
      String? userId,}){
    _chatUser = chatUser;
    _lastLoginUser = lastLoginUser;
    _token = token;
    _userId = userId;
}

  AuthInfo.fromJson(dynamic json) {
    _chatUser = json['chatUser'] != null ? ChatUser.fromJson(json['chatUser']) : null;
    _lastLoginUser = json['lastLoginUser'];
    _token = json['token'];
    _userId = json['userId'];
  }
  ChatUser? _chatUser;
  bool? _lastLoginUser;
  String? _token;
  String? _userId;
AuthInfo copyWith({  ChatUser? chatUser,
  bool? lastLoginUser,
  String? token,
  String? userId,
}) => AuthInfo(  chatUser: chatUser ?? _chatUser,
  lastLoginUser: lastLoginUser ?? _lastLoginUser,
  token: token ?? _token,
  userId: userId ?? _userId,
);
  ChatUser? get chatUser => _chatUser;
  bool? get lastLoginUser => _lastLoginUser;
  String? get token => _token;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_chatUser != null) {
      map['chatUser'] = _chatUser?.toJson();
    }
    map['lastLoginUser'] = _lastLoginUser;
    map['token'] = _token;
    map['userId'] = _userId;
    return map;
  }

}

/// avatar : "https://xhyimage.oss-cn-shenzhen.aliyuncs.com/system/sex/sex1.png"
/// birthday : "0"
/// email : null
/// extension : "{\"userId\":907885191889035264}"
/// gender : "1"
/// label : null
/// mobile : "13333333333"
/// nickName : "笔直的乡村"
/// remark : null
/// sessionId : null
/// status : 0
/// type : 0
/// userId : "05b3dcc21d934283b2c493b8fbf88a7b"

class ChatUser {
  ChatUser({
      String? avatar, 
      String? birthday, 
      dynamic email, 
      String? extension, 
      String? gender, 
      dynamic label, 
      String? mobile, 
      String? nickName, 
      dynamic remark, 
      dynamic sessionId, 
      num? status, 
      num? type, 
      String? userId,}){
    _avatar = avatar;
    _birthday = birthday;
    _email = email;
    _extension = extension;
    _gender = gender;
    _label = label;
    _mobile = mobile;
    _nickName = nickName;
    _remark = remark;
    _sessionId = sessionId;
    _status = status;
    _type = type;
    _userId = userId;
}

  ChatUser.fromJson(dynamic json) {
    _avatar = json['avatar'];
    _birthday = json['birthday'];
    _email = json['email'];
    _extension = json['extension'];
    _gender = json['gender'];
    _label = json['label'];
    _mobile = json['mobile'];
    _nickName = json['nickName'];
    _remark = json['remark'];
    _sessionId = json['sessionId'];
    _status = json['status'];
    _type = json['type'];
    _userId = json['userId'];
  }
  String? _avatar;
  String? _birthday;
  dynamic _email;
  String? _extension;
  String? _gender;
  dynamic _label;
  String? _mobile;
  String? _nickName;
  dynamic _remark;
  dynamic _sessionId;
  num? _status;
  num? _type;
  String? _userId;
ChatUser copyWith({  String? avatar,
  String? birthday,
  dynamic email,
  String? extension,
  String? gender,
  dynamic label,
  String? mobile,
  String? nickName,
  dynamic remark,
  dynamic sessionId,
  num? status,
  num? type,
  String? userId,
}) => ChatUser(  avatar: avatar ?? _avatar,
  birthday: birthday ?? _birthday,
  email: email ?? _email,
  extension: extension ?? _extension,
  gender: gender ?? _gender,
  label: label ?? _label,
  mobile: mobile ?? _mobile,
  nickName: nickName ?? _nickName,
  remark: remark ?? _remark,
  sessionId: sessionId ?? _sessionId,
  status: status ?? _status,
  type: type ?? _type,
  userId: userId ?? _userId,
);
  String? get avatar => _avatar;
  String? get birthday => _birthday;
  dynamic get email => _email;
  String? get extension => _extension;
  String? get gender => _gender;
  dynamic get label => _label;
  String? get mobile => _mobile;
  String? get nickName => _nickName;
  dynamic get remark => _remark;
  dynamic get sessionId => _sessionId;
  num? get status => _status;
  num? get type => _type;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar'] = _avatar;
    map['birthday'] = _birthday;
    map['email'] = _email;
    map['extension'] = _extension;
    map['gender'] = _gender;
    map['label'] = _label;
    map['mobile'] = _mobile;
    map['nickName'] = _nickName;
    map['remark'] = _remark;
    map['sessionId'] = _sessionId;
    map['status'] = _status;
    map['type'] = _type;
    map['userId'] = _userId;
    return map;
  }

}