import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sy_im_sdk/common/session_type.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'package:sy_im_sdk/listener/sy_conversation_listener.dart';
import 'package:sy_im_sdk/listener/sy_on_dart_connect_listener.dart';
import 'package:sy_im_sdk/listener/sy_on_message_listener.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/sy_contact.dart';
import 'package:sy_im_sdk/manager/data/sy_conversation.dart';
import 'package:sy_im_sdk/manager/data/sy_message.dart';
import 'package:sy_im_sdk/sy_client.dart';

class MyExampleApp extends StatefulWidget {
  const MyExampleApp({super.key});

  @override
  State<MyExampleApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyExampleApp> {
  String _connectStatus = 'Unknown';
  String _result = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    // try {
    //   platformVersion =
    //       await _syImSdkPlugin.getPlatformVersion() ?? 'Unknown platform version';
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 在主线程中执行需要的操作
      SyOptions syOptions = SyOptions();
      syOptions.appId = "7155793691347525633";
      syOptions.secret =
          "1aa1432b98335fb4033fa6ba54aea0fc436c04061f5c1369f77f72ea30d6240d";
      syOptions.autoLogin = false;
      syOptions.environment = SyEnvironmentEnum.prod;
      SyClient.getInstance().init(syOptions: syOptions);
      SyClient.getInstance()
          .addConnectListener(OnDartConnectListener(onConnectSuccess: () {
        setState(() {
          _connectStatus = "SDK已链接成功！";
        });
      }, onForcedOffLine: () {
        setState(() {
          _connectStatus = "被顶下线";
        });
      }, onConnectFail: (code, errMsg) {
        setState(() {
          _connectStatus = "链接断开";
        });
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('connect is: $_connectStatus'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('result : $_result'),
                ),
                _buildButton(
                    title: "TOKEN登录",
                    onPressed: () {
                      SyClient.getInstance().loginByToken(
                        token: "d222a490c1097dffa9cc6400e38d4277",
                        callback: SyCallBack(onSuccess: (authInfo) {
                          print("登录成功:${authInfo.toJson()}");
                          setState(() {
                            _result = "${authInfo.toJson()}";
                          });
                        }, onFail: (code, msg) {
                          print("登录失败 code:$code msg:$msg");
                        }),
                      );
                    }),
                Container(
                  height: 5,
                ),
                _buildButton(
                    title: "UUID登录",
                    onPressed: () {
                      SyClient.getInstance().loginByUUID(
                        uuid: "69d5d26380494fa9ab7a81ee5267957f",
                        callback: SyCallBack(onSuccess: (authInfo) {
                          print("登录成功:${authInfo.toJson()}");
                          setState(() {
                            _result = "${authInfo.toJson()}";
                          });
                        }, onFail: (code, msg) {
                          print("登录失败 code:$code msg:$msg");
                        }),
                      );
                    }),
                Container(
                  height: 5,
                ),
                _buildButton(
                    title: "退出登录",
                    onPressed: () {
                      print("退出登录");
                      SyClient.getInstance().logOut(
                          callback: SyCallBack(onSuccess: (msg) {
                        print("退出登录成功:$msg");
                        setState(() {
                          _result = "已退出登录";
                        });
                      }, onFail: (code, msg) {
                        print("退出登录失败code:$code msg:$msg");
                      }));
                    }),
                Container(
                  height: 5,
                ),
                _buildButton(
                    title: "添加消息监听",
                    onPressed: () {
                      SyClient.getInstance().chatManager().addMessageListener(
                              OnMessageListener(
                                  onCmdMsg: (List<SyMessage> syMessage) {
                            String result = "onCmdMsg：";
                            syMessage.forEach((e) {
                              result += e.content!;
                            });
                            setState(() {
                              _result = result;
                            });
                          }, onMessage: (List<SyMessage> syMessage) {
                            String result = "onMessage：";
                            syMessage.forEach((e) {
                              result += e.content!;
                            });
                            setState(() {
                              _result = result;
                            });
                          }, onStatusChange: (List<SyMessage> syMessage) {
                            String result = "onCmdMsg：";
                            syMessage.forEach((e) {
                              result += e.content!;
                            });
                            setState(() {
                              _result = result;
                            });
                          }));
                    }),
                const SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "用userid创建会话",
                    onPressed: () {
                      SyClient.getInstance()
                          .conversationManager()
                          .createSignConversationByUid(
                              userId: "66666666666666666666666666666666",
                              callback: SyCallBack(
                                  onSuccess: (conversion) {
                                    setState(() {
                                      _result = "${conversion.toJson()}";
                                    });
                                  },
                                  onFail: (String code, String errMsg) {}));
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "用contact创建会话",
                    onPressed: () {
                      var contact = SyContact();
                      contact.userId = "66666666666666666666666666666666";
                      SyClient.getInstance()
                          .conversationManager()
                          .createSignConversationByContact(
                              contact: contact,
                              callback: SyCallBack(onSuccess: (conversion) {
                                setState(() {
                                  _result = "${conversion.toJson()}";
                                });
                              }, onFail: (code, msg) {
                                setState(() {
                                  _result = "${msg}";
                                });
                              }));
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "进入会话",
                    onPressed: () {
                      SyClient.getInstance().conversationManager().addChatting(
                          "7155793691347525633_P__66666666666666666666666666666666");
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "获取所有未读数",
                    onPressed: () async {
                      int num = await SyClient.getInstance()
                          .conversationManager()
                          .getAllUnReadNum();
                      setState(() {
                        _result = "${num}";
                      });
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "获取单个会话的未读数",
                    onPressed: () async {
                      int num = await SyClient.getInstance()
                          .conversationManager()
                          .getUnReadNum(
                              "7155793691347525633_P__66666666666666666666666666666666");
                      setState(() {
                        _result = "${num}";
                      });
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "获取会话列表",
                    onPressed: () {
                      SyClient.getInstance()
                          .conversationManager()
                          .getConversationList(
                              callback: SyCallBack<List<SyConversation>>(
                                  onSuccess: (List<SyConversation> t) {
                                    String result = "";
                                    t.forEach((e) {
                                      result += e.name! + ",";
                                    });
                                    setState(() {
                                      _result = result;
                                    });
                                  },
                                  onFail: (String code, String errMsg) {}));
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "监听会话变更",
                    onPressed: () {
                      SyClient.getInstance()
                          .conversationManager()
                          .addConversationListener(ConversationListener((list) {
                        setState(() {
                          _result = "${list.toString()}";
                          print("----------->${list[0].lastMessage}");
                        });
                      }));
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "推出会话",
                    onPressed: () {
                      SyClient.getInstance().conversationManager().removeChatting(
                          "7155793691347525633_P__66666666666666666666666666666666");
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "查询好友关系",
                    onPressed: () async {
                      SyClient.getInstance().contactManager().getUserInfo(
                          userId: "d95ee550bf624d38adb8cef891f1bb34",
                          callback: SyCallBack(
                              onSuccess: (ss) {
                                setState(() {
                                  _result = "${ss.toJson()}";
                                });
                              },
                              onFail: (c, s) {}));
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "同步查询好友关系",
                    onPressed: () async {
                      var aaa = await SyClient.getInstance()
                          .contactManager()
                          .getUserInfoFromCache(
                              "d95ee550bf624d38adb8cef891f1bb34");
                      setState(() {
                        _result = "${aaa.toJson()}";
                      });
                    }),
                SizedBox(
                  height: 5,
                ),
                _buildButton(
                    title: "设置备注",
                    onPressed: () async {
                      var isf = await SyClient.getInstance()
                          .contactManager()
                          .isFriend("d95ee550bf624d38adb8cef891f1bb34");
                      if (!isf) {
                        SyClient.getInstance().contactManager().addFriend(
                            userId: "d95ee550bf624d38adb8cef891f1bb34",
                            callback: SyCallBack<bool>(onSuccess: (info) {
                              SyClient.getInstance()
                                  .contactManager()
                                  .editFriendRemark(
                                      userId:
                                          "d95ee550bf624d38adb8cef891f1bb34",
                                      remark: "客服111",
                                      callback: SyCallBack(
                                          onSuccess: (a) {},
                                          onFail: (c, d) {}));
                            }, onFail: (code, msg) {
                              print("msg:$msg");
                            }));
                      } else {
                        SyClient.getInstance()
                            .contactManager()
                            .editFriendRemark(
                                userId: "66666666666666666666666666666666",
                                remark: "客服",
                                callback: SyCallBack(
                                    onSuccess: (a) {
                                      print("msg editFriendRemark :$a");
                                    },
                                    onFail: (c, d) {}));
                      }
                    })
              ],
            ),
          )),
    );
  }

  MaterialButton _buildButton(
      {required String title, required VoidCallback onPressed}) {
    return MaterialButton(
      minWidth: 200,
      height: 50,
      color: Colors.blue,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
