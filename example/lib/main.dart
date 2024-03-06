import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sy_im_sdk/config/sy_options.dart';
import 'dart:async';

import 'package:sy_im_sdk/listener/on_dart_connect_listener.dart';
import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/manager/data/auth_info.dart';
import 'package:sy_im_sdk/sy_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _connectStatus = 'Unknown';
  String _loginInfo = 'Unknown';

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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Text('connect status is: $_connectStatus'),
              ),
              SizedBox(
                height: 200,
                child: Text('login userInfo is: $_loginInfo'),
              ),
              _buildButton(
                  title: "TOKEN登录",
                  onPressed: () {
                    SyClient.getInstance().loginByToken(
                      token: "55fa75a3f2c60fab04fb28eb09477e91",
                      callback: SyCallBack(onSuccess: (authInfo) {
                        print("登录成功:${authInfo.toJson()}");
                        setState(() {
                          _loginInfo = "${authInfo.toJson()}";
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
                      uuid: "05b3dcc21d934283b2c493b8fbf88a7b",
                      callback: SyCallBack(onSuccess: (authInfo) {
                        print("登录成功:${authInfo.toJson()}");
                        setState(() {
                          _loginInfo = "${authInfo.toJson()}";
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
                    SyClient.getInstance().logOut(
                        callback: SyCallBack(onSuccess: (msg) {
                      print("退出登录成功:$msg");
                    }, onFail: (code, msg) {
                      print("退出登录失败code:$code msg:$msg");
                    }));
                  })
            ],
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
