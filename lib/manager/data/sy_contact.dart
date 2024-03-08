class SyContact {
  SyContact({
    String? avatar,
    String? birthday,
    String? email,
    Extension? extension,
    String? gender,
    String? label,
    String?mobile,
    String? nickName,
    String? remark,
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
    _status = status;
    _type = type;
    _userId = userId;
  }

  SyContact.fromJson(dynamic json) {
    _avatar = json['avatar'];
    _birthday = json['birthday'];
    _email = json['email'];
    _extension = json['extension'] != null ? Extension.fromJson(json['extension']) : null;
    _gender = json['gender'];
    _label = json['label'];
    _mobile = json['mobile'];
    _nickName = json['nickName'];
    _remark = json['remark'];
    _status = json['status'];
    _type = json['type'];
    _userId = json['userId'];
  }
  String? _avatar;
  String? _birthday;
  String? _email;
  Extension? _extension;
  String? _gender;
  String? _label;
  String? _mobile;
  String? _nickName;
  String? _remark;
  num? _status;
  num? _type;
  String? _userId;
  SyContact copyWith({  String? avatar,
    String? birthday,
    String? email,
    Extension? extension,
    String? gender,
    String? label,
    String? mobile,
    String? nickName,
    String? remark,
    num? status,
    num? type,
    String? userId,
  }) => SyContact(  avatar: avatar ?? _avatar,
    birthday: birthday ?? _birthday,
    email: email ?? _email,
    extension: extension ?? _extension,
    gender: gender ?? _gender,
    label: label ?? _label,
    mobile: mobile ?? _mobile,
    nickName: nickName ?? _nickName,
    remark: remark ?? _remark,
    status: status ?? _status,
    type: type ?? _type,
    userId: userId ?? _userId,
  );
  String? get avatar => _avatar;
  set avatar(String? value) {
    _avatar = value;
  }
  String? get birthday => _birthday;
  set birthday(String? value) {
    _birthday = value;
  }
  String? get email => _email;
  set email(String? value) {
    _email = value;
  }
  Extension? get extension => _extension;
  set extension(Extension? value) {
    _extension = value;
  }
  String? get gender => _gender;
  set gender(String? value) {
    _gender = value;
  }
  String? get label => _label;
  set label(String? value) {
    _label = value;
  }
  String? get mobile => _mobile;
  set mobile(String? value) {
    _mobile = value;
  }
  String? get nickName => _nickName;
  set nickName(String? value) {
    _nickName = value;
  }
  String? get remark => _remark;
  set remark(String? value) {
    _remark = value;
  }
  num? get status => _status;
  num? get type => _type;
  String? get userId => _userId;
  set userId(String? value) {
    _userId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar'] = _avatar;
    map['birthday'] = _birthday;
    map['email'] = _email;
    if (_extension != null) {
      map['extension'] = _extension?.toJson();
    }
    map['gender'] = _gender;
    map['label'] = _label;
    map['mobile'] = _mobile;
    map['nickName'] = _nickName;
    map['remark'] = _remark;
    map['status'] = _status;
    map['type'] = _type;
    map['userId'] = _userId;
    return map;
  }

}
/// avatar : ""
/// birthday : null
/// email : null
/// extension : {"extension":"{\"userId\":666}","userId":666}
/// gender : "1"
/// label : null
/// mobile : null
/// nickName : "官方消息"
/// remark : null
/// status : 0
/// type : 0
/// userId : "66666666666666666666666666666666"



/// extension : "{\"userId\":666}"
/// userId : 666

class Extension {
  Extension({
    String? extension,
    num? userId,}){
    _extension = extension;
    _userId = userId;
  }

  Extension.fromJson(dynamic json) {
    _extension = json['extension'];
    _userId = json['userId'];
  }
  String? _extension;
  num? _userId;
  Extension copyWith({  String? extension,
    num? userId,
  }) => Extension(  extension: extension ?? _extension,
    userId: userId ?? _userId,
  );
  String? get extension => _extension;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['extension'] = _extension;
    map['userId'] = _userId;
    return map;
  }

}