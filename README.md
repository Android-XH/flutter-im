# sy_im_sdk

## 依赖SDK

### 配置SDK依赖

        在项目根目录pubspec.yaml文件中dependencies节点下添加：
        dependencies:
            ……
            sy_im_sdk:
            git:
            url: https://github.com/Android-XH/flutter-im.git
            ref: 1.0.0

### 下载依赖包

        flutter pub get

### 查看依赖结果

        + sy_im_sdk 0.0.1 from git https://github.com/Android-XH/flutter-im.git at 184ffe

## 初始化SDK

### 构造SDK配置

        SyOptions syOptions = SyOptions();
        syOptions.appId = "您的AppID";
        syOptions.secret = "您的secret";
        //SDK运行环境
        syOptions.environment=SyEnvironmentEnum.prod;

### 调用初始化方法：

        SyClient.getInstance().init(syOptions: syOptions);

## 用户登录

### 通过业务方UUID登录

        SyClient.getInstance().loginByUUID(
            uuid: "uuid", // 第三方 uuid, 测试使用, 正式请使用 token 方式登录
            callback: SyCallBack(
                onSuccess: (authInfo) {
                    //todo 处理登录成功逻辑
                }, 
                onFail: (code, msg) {
                    //todo 处理登录失败逻辑
                })
        );

### 通过token登录

        SyClient.getInstance().loginByToken(
            token: "token",
            callback: SyCallBack(
                onSuccess: (authInfo) {
                    //todo 处理登录成功逻辑
                }, 
                onFail: (code, msg) {
                    //todo 处理登录失败逻辑
                })
        );   

## 会话管理

### 创建会话（无用户信息）

        SyClient.getInstance().conversationManager().createSignConversationByUid(userId: userId, callback: SyCallBack<SyConversation>(
            onSuccess: (conversation) {
              /*会回调会话的信息*/
              /*sessionId 是会话id,发送消息需要*/
              var sessionId =  conversation.sessionId;
              /*会话中对方存在sdk服务器的用户信息*/
              var info = conversation.contact;
            },
            onFail: (code, msg) {
              /*错误*/
            })
        );

### 创建会话（有用户信息）

        SyContact contact =SyContact();
        //contact.userId 为必传字段，其他信息可以根据业务需要自行增加
        contact.userId="";
        contact.avatar="";
        contact.nickName="";
        SyClient.getInstance().conversationManager().createSignConversationByContact(contact: contact, callback: SyCallBack<SyConversation>(
            onSuccess: (conversation) {
              // conversation 回调会话的信息
              // conversation.sessionId 是会话id,发送消息需要*/
            },
            onFail: (code, msg) {
                //处理错误信息
            })
        );

### 获取会话列表

         SyClient.getInstance().conversationManager().getConversationList(
            callback: SyCallBack<List<SyConversation>>(onSuccess: (conversationList) {
              /*会话列表*/
            }, 
            onFail: (code, msg) {
              /*异常*/
            })
        );

### 初始化会话监听

        ConversationListener listener = ConversationListener((conversationList) {
        
        });

### 注册会话监听

        SyClient.getInstance().conversationManager().addConversationListener(listener);

### 移除会话监听

        SyClient.getInstance().conversationManager().removeConversationListener(listener);

### 会话开启聊天

        SyClient.getInstance().conversationManager().addChatting(sessionId);

### 会话退出聊天

        SyClient.getInstance().conversationManager().removeChatting(sessionId);

### 重置会话未读消息数量

        SyClient.getInstance().conversationManager().restUnReadCount(sessionId);

### 获取单个会话未读消息数量

        int num = await SyClient.getInstance().conversationManager().getUnReadNum(sessionId);

### 获取所有群聊会话未读消息数量

        int num = await SyClient.getInstance().conversationManager().getAllUnReadNumBySessionType(sessionType: SessionType.GROUP); 

### 获取所有单聊会话未读消息数量

        int num = await SyClient.getInstance().conversationManager().getAllUnReadNumBySessionType(sessionType: SessionType.PRIVATE); 

### 获取所有会话未读消息数量

        int num = await SyClient.getInstance().conversationManager().getAllUnReadNum();

## 聊天管理

### 获取聊天记录

        SyMessage syMessage = SyMessage();
        syMessage.msgTimeStamp = DateTime.timestamp().millisecond;
        syMessage.sessionId = "会话ID";
        int pageSize = 20;
        SyClient.getInstance().chatManager().getMessageList(
            starMessage: syMessage,
            pageSize: pageSize,
            callBack: SyCallBack(
                onSuccess: (messageList) {
                    //todo 处理消息
                    }, 
                onFail: (code, error) {
                    //todo 处理查询失败
                })
        );

### 发送消息

         _getReceiveUserInfo() {
            SyContact receiveUserInfo = SyContact();
            receiveUserInfo.userId = "消息接收人用户ID";
            receiveUserInfo.avatar = "接收人头像";
            receiveUserInfo.nickName = "消息接收人用户昵称";
            return receiveUserInfo;
        }

        //发送文本消息
        _sendTxtMessage(String content) {
            SyMessage syMessage = SyMessage.buildTxtMsg(_getReceiveUserInfo(), content);
            
            SyClient.getInstance().chatManager().sendMessage(
                syMessage: syMessage,
                callBack: SyCallBack(onSuccess: (syMessage) {
                //todo 发送成功回调
                }, 
                    onFail: (code, error) {
                //todo 发送失败回调
                })
            );
        }
        
        //发送图片消息（传入图片URI地址）
        _sendImgMessage(Uri uri) {
            SyMessage syMessage = SyMessage.buildImgMsg(_getReceiveUserInfo(), uri);
            
            SyClient.getInstance().chatManager().sendMessage(
                syMessage: syMessage,
                callBack: SyCallBack(onSuccess: (syMessage) {
                    //todo 发送成功回调
                }, 
                onFail: (code, error) {
                    //todo 发送失败回调
                })
            );
        }
        
        //发送自定义消息
        _sendCustomMessage(String content) {
                SyMessage syMessage = SyMessage.buildCustomMsg(_getReceiveUserInfo(), content);
                
                SyClient.getInstance().chatManager().sendMessage(
                    syMessage: syMessage,
                    callBack: SyCallBack(onSuccess: (syMessage) {
                    //todo 发送成功回调
                    }, 
                    onFail: (code, error) {
                    //todo 发送失败回调
                    })
            );
        }

### 保存消息到本地

        SyMessage syMessage = SyMessage.buildTxtMsg(_getReceiveUserInfo(), content);

        SyClient.getInstance().chatManager().saveMessageToLocal(
            syMessage: syMessage,
            callBack: SyCallBack(
                onSuccess: (syMessage) {
                //todo 保存成功回调
                }, 
                onFail: (code, error) {
                //todo 保存失败回调
                },
            ),
        );    
### 删除消息
        SyClient.getInstance().chatManager().deleteMessage(
          msgId: "消息ID",
          sessionId: '会话ID',
          callBack: SyCallBack(
            onSuccess: (bool status) {
              //todo 处理删除成功逻辑
            },
            onFail: (String code, String error) {
              //todo 处理删除失败逻辑
            },
          ),
        );
### 消息监听
        1、初始化消息监听

        OnMessageListener onMessageListener=OnMessageListener(
            onMessage: (List<SyMessage> syMessage) {
                //todo 处理新消息
            }, 
            onCmdMsg: (List<SyMessage> syMessage) {
                //todo 处理命令消息
            }, 
            onStatusChange: (List<SyMessage> syMessage) {
                //todo 处理状态变更消息
            },
        )
        2、注册消息监听
        
        SyClient.getInstance().chatManager().addMessageListener(onMessageListener);

        3、移除消息监听

        SyClient.getInstance().chatManager().removeMessageListener(onMessageListener);