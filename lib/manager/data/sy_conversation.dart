import 'package:sy_im_sdk/manager/data/sy_connect.dart';

/// associationId : "66666666666666666666666666666666"
/// avatar : ""
/// contact : {"avatar":"","birthday":null,"email":null,"extension":{"extension":"{\"userId\":666}","userId":666},"gender":"1","label":null,"mobile":null,"nickName":"官方消息","remark":null,"status":0,"type":0,"userId":"66666666666666666666666666666666"}
/// key : "7155793691347525633_P_05b3dcc21d934283b2c493b8fbf88a7b_66666666666666666666666666666666_05b3dcc21d934283b2c493b8fbf88a7b"
/// lastMessage : null
/// localData : true
/// name : "官方消息"
/// needSyncMsg : 0
/// sendUserId : null
/// sessionId : "7155793691347525633_P_05b3dcc21d934283b2c493b8fbf88a7b_66666666666666666666666666666666"
/// sessionType : 1
/// syncMsgEndSeq : 0
/// syncMsgSeq : 0
/// topping : false
/// unReadNum : 0
/// updateTimeStamp : 1709792558869

class SyConversation {
  SyConversation({
      String? associationId, 
      String? avatar, 
      Contact? contact, 
      String? key, 
      dynamic lastMessage, 
      bool? localData, 
      String? name, 
      num? needSyncMsg, 
      dynamic sendUserId, 
      String? sessionId, 
      num? sessionType, 
      num? syncMsgEndSeq, 
      num? syncMsgSeq, 
      bool? topping, 
      num? unReadNum, 
      num? updateTimeStamp,}){
    _associationId = associationId;
    _avatar = avatar;
    _contact = contact;
    _key = key;
    _lastMessage = lastMessage;
    _localData = localData;
    _name = name;
    _needSyncMsg = needSyncMsg;
    _sendUserId = sendUserId;
    _sessionId = sessionId;
    _sessionType = sessionType;
    _syncMsgEndSeq = syncMsgEndSeq;
    _syncMsgSeq = syncMsgSeq;
    _topping = topping;
    _unReadNum = unReadNum;
    _updateTimeStamp = updateTimeStamp;
}

  SyConversation.fromJson(dynamic json) {
    _associationId = json['associationId'];
    _avatar = json['avatar'];
    _contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    _key = json['key'];
    _lastMessage = json['lastMessage'];
    _localData = json['localData'];
    _name = json['name'];
    _needSyncMsg = json['needSyncMsg'];
    _sendUserId = json['sendUserId'];
    _sessionId = json['sessionId'];
    _sessionType = json['sessionType'];
    _syncMsgEndSeq = json['syncMsgEndSeq'];
    _syncMsgSeq = json['syncMsgSeq'];
    _topping = json['topping'];
    _unReadNum = json['unReadNum'];
    _updateTimeStamp = json['updateTimeStamp'];
  }
  String? _associationId;
  String? _avatar;
  Contact? _contact;
  String? _key;
  dynamic _lastMessage;
  bool? _localData;
  String? _name;
  num? _needSyncMsg;
  dynamic _sendUserId;
  String? _sessionId;
  num? _sessionType;
  num? _syncMsgEndSeq;
  num? _syncMsgSeq;
  bool? _topping;
  num? _unReadNum;
  num? _updateTimeStamp;
SyConversation copyWith({  String? associationId,
  String? avatar,
  Contact? contact,
  String? key,
  dynamic lastMessage,
  bool? localData,
  String? name,
  num? needSyncMsg,
  dynamic sendUserId,
  String? sessionId,
  num? sessionType,
  num? syncMsgEndSeq,
  num? syncMsgSeq,
  bool? topping,
  num? unReadNum,
  num? updateTimeStamp,
}) => SyConversation(  associationId: associationId ?? _associationId,
  avatar: avatar ?? _avatar,
  contact: contact ?? _contact,
  key: key ?? _key,
  lastMessage: lastMessage ?? _lastMessage,
  localData: localData ?? _localData,
  name: name ?? _name,
  needSyncMsg: needSyncMsg ?? _needSyncMsg,
  sendUserId: sendUserId ?? _sendUserId,
  sessionId: sessionId ?? _sessionId,
  sessionType: sessionType ?? _sessionType,
  syncMsgEndSeq: syncMsgEndSeq ?? _syncMsgEndSeq,
  syncMsgSeq: syncMsgSeq ?? _syncMsgSeq,
  topping: topping ?? _topping,
  unReadNum: unReadNum ?? _unReadNum,
  updateTimeStamp: updateTimeStamp ?? _updateTimeStamp,
);
  String? get associationId => _associationId;
  String? get avatar => _avatar;
  Contact? get contact => _contact;
  String? get key => _key;
  dynamic get lastMessage => _lastMessage;
  bool? get localData => _localData;
  String? get name => _name;
  num? get needSyncMsg => _needSyncMsg;
  dynamic get sendUserId => _sendUserId;
  String? get sessionId => _sessionId;
  num? get sessionType => _sessionType;
  num? get syncMsgEndSeq => _syncMsgEndSeq;
  num? get syncMsgSeq => _syncMsgSeq;
  bool? get topping => _topping;
  num? get unReadNum => _unReadNum;
  num? get updateTimeStamp => _updateTimeStamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['associationId'] = _associationId;
    map['avatar'] = _avatar;
    if (_contact != null) {
      map['contact'] = _contact?.toJson();
    }
    map['key'] = _key;
    map['lastMessage'] = _lastMessage;
    map['localData'] = _localData;
    map['name'] = _name;
    map['needSyncMsg'] = _needSyncMsg;
    map['sendUserId'] = _sendUserId;
    map['sessionId'] = _sessionId;
    map['sessionType'] = _sessionType;
    map['syncMsgEndSeq'] = _syncMsgEndSeq;
    map['syncMsgSeq'] = _syncMsgSeq;
    map['topping'] = _topping;
    map['unReadNum'] = _unReadNum;
    map['updateTimeStamp'] = _updateTimeStamp;
    return map;
  }

}

