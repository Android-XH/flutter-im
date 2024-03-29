import 'package:sy_im_sdk/manager/data/sy_contact.dart';

/// content : "111"
/// msgId : "7155793691347525633_P_05b3dcc21d934283b2c493b8fbf88a7b_d95ee550bf624d38adb8cef891f1bb34_38_05b3dcc21d934283b2c493b8fbf88a7b"
/// msgTimeStamp : 1709874665838
/// read : false
/// receiveUserInfo : {"avatar":"https://xhyimage.oss-cn-shenzhen.aliyuncs.com/system/sex/sex1.png","birthday":"0","email":null,"extension":{"extension":"{\"userId\":907885191889035264}","userId":907885191889035264},"gender":"1","label":null,"mobile":"13333333333","nickName":"笔直的乡村","remark":null,"status":0,"type":0,"userId":"05b3dcc21d934283b2c493b8fbf88a7b"}
/// requestId : "7155793691347525633_P_05b3dcc21d934283b2c493b8fbf88a7b_d95ee550bf624d38adb8cef891f1bb34_38"
/// send : false
/// sendListener : null
/// sendUserInfo : {"avatar":"https://xiaomai-images.oss-cn-shanghai.aliyuncs.com/user/910380166729428992/1706491068cropImage.jpeg","birthday":null,"email":null,"extension":{"extension":"{\"userId\":910380166729428992}","userId":910380166729428992},"gender":"1","label":null,"mobile":null,"nickName":"平和的","remark":null,"status":0,"type":0,"userId":"d95ee550bf624d38adb8cef891f1bb34"}
/// sessionId : "7155793691347525633_P_05b3dcc21d934283b2c493b8fbf88a7b_d95ee550bf624d38adb8cef891f1bb34"
/// sessionType : 1
/// status : 1
/// type : 0
/// uri : data/image/xxxx.png

class SyMessage {
  SyMessage({
    String? content,
    String? msgId,
    int? msgTimeStamp,
    bool? read,
    SyContact? receiveUserInfo,
    String? requestId,
    bool? send,
    SyContact? sendUserInfo,
    String? sessionId,
    int? sessionType,
    int? status,
    int? type,
    Uri? uri,
  }) {
    _content = content;
    _msgId = msgId;
    _msgTimeStamp = msgTimeStamp;
    _read = read;
    _receiveUserInfo = receiveUserInfo;
    _requestId = requestId;
    _send = send;
    _sendUserInfo = sendUserInfo;
    _sessionId = sessionId;
    _sessionType = sessionType;
    _status = status;
    _type = type;
    _uri = uri;
  }

  SyMessage.fromJson(dynamic json) {
    _content = json['content'];
    _msgId = json['msgId'];
    _msgTimeStamp = json['msgTimeStamp'];
    _read = json['read'];
    _receiveUserInfo = json['receiveUserInfo'] != null
        ? SyContact.fromJson(json['receiveUserInfo'])
        : null;
    _requestId = json['requestId'];
    _send = json['send'];
    _sendUserInfo = json['sendUserInfo'] != null
        ? SyContact.fromJson(json['sendUserInfo'])
        : null;
    _sessionId = json['sessionId'];
    _sessionType = json['sessionType'];
    _status = json['status'];
    _type = json['type'];
    _uri = json['uri'];
  }

  String? _content;
  String? _msgId;
  int? _msgTimeStamp;
  bool? _read;
  SyContact? _receiveUserInfo;
  String? _requestId;
  bool? _send;

  SyContact? _sendUserInfo;
  String? _sessionId;
  int? _sessionType;
  int? _status;
  int? _type;
  Uri? _uri;

  SyMessage copyWith({
    String? content,
    String? msgId,
    int? msgTimeStamp,
    bool? read,
    SyContact? receiveUserInfo,
    String? requestId,
    bool? send,
    SyContact? sendUserInfo,
    String? sessionId,
    int? sessionType,
    int? status,
    int? type,
    Uri? uri,
  }) =>
      SyMessage(
        content: content ?? _content,
        msgId: msgId ?? _msgId,
        msgTimeStamp: msgTimeStamp ?? _msgTimeStamp,
        read: read ?? _read,
        receiveUserInfo: receiveUserInfo ?? _receiveUserInfo,
        requestId: requestId ?? _requestId,
        send: send ?? _send,
        sendUserInfo: sendUserInfo ?? _sendUserInfo,
        sessionId: sessionId ?? _sessionId,
        sessionType: sessionType ?? _sessionType,
        status: status ?? _status,
        type: type ?? _type,
        uri: uri ?? _uri,
      );

  String? get content => _content;

  String? get msgId => _msgId;

  int? get msgTimeStamp => _msgTimeStamp;

  bool? get read => _read;

  SyContact? get receiveUserInfo => _receiveUserInfo;

  String? get requestId => _requestId;

  bool? get send => _send;

  SyContact? get sendUserInfo => _sendUserInfo;

  String? get sessionId => _sessionId;

  int? get sessionType => _sessionType;

  int? get status => _status;

  int? get type => _type;

  Uri? get uri => _uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    map['msgId'] = _msgId;
    map['msgTimeStamp'] = _msgTimeStamp;
    map['read'] = _read;
    if (_receiveUserInfo != null) {
      map['receiveUserInfo'] = _receiveUserInfo?.toJson();
    }
    map['requestId'] = _requestId;
    map['send'] = _send;
    if (_sendUserInfo != null) {
      map['sendUserInfo'] = _sendUserInfo?.toJson();
    }
    map['sessionId'] = _sessionId;
    map['sessionType'] = _sessionType;
    map['status'] = _status;
    map['type'] = _type;
    map['uri'] = _uri;
    return map;
  }

  set uri(Uri? value) {
    _uri = value;
  }

  set type(int? value) {
    _type = value;
  }

  set status(int? value) {
    _status = value;
  }

  set sessionType(int? value) {
    _sessionType = value;
  }

  set sessionId(String? value) {
    _sessionId = value;
  }

  set sendUserInfo(SyContact? value) {
    _sendUserInfo = value;
  }

  set send(bool? value) {
    _send = value;
  }

  set requestId(String? value) {
    _requestId = value;
  }

  set receiveUserInfo(SyContact? value) {
    _receiveUserInfo = value;
  }

  set read(bool? value) {
    _read = value;
  }

  set msgTimeStamp(int? value) {
    _msgTimeStamp = value;
  }

  set msgId(String? value) {
    _msgId = value;
  }

  set content(String? value) {
    _content = value;
  }

  ///创建文本消息
  SyMessage.buildTxtMsg(SyContact receiveUserInfo, String content) {
    _content = content;
    _receiveUserInfo = _receiveUserInfo;
    _type = 0;
  }

  ///创建图片消息
  SyMessage.buildImgMsg(SyContact receiveUserInfo, Uri uri) {
    _uri = uri;
    _receiveUserInfo = _receiveUserInfo;
    _type = 1;
  }

  ///创建语音消息
  SyMessage.buildVideoMsg(SyContact receiveUserInfo, Uri uri) {
    _uri = uri;
    _receiveUserInfo = _receiveUserInfo;
    _type = 2;
  }

  ///创建语音消息
  SyMessage.buildVoiceMsg(SyContact receiveUserInfo, Uri uri) {
    _uri = uri;
    _receiveUserInfo = _receiveUserInfo;
    _type = 3;
  }

  ///创建自定义消息
  SyMessage.buildCustomMsg(SyContact receiveUserInfo, String content) {
    _content = content;
    _receiveUserInfo = _receiveUserInfo;
    _type = 99;
  }
}
