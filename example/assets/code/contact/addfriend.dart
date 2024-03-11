import 'package:sy_im_sdk/listener/sy_call_back.dart';
import 'package:sy_im_sdk/sy_client.dart';

class AddFriend{
  /*添加好友：好友关系是单向好友*/
  void addFriend(String userId){
    SyClient.getInstance().contactManager().addFriend(userId: userId,callback: SyCallBack<bool>(onSuccess: (success){
      /*成功回调*/
    }, onFail: (code,msg){
      /*失败回调*/
    }));
  }

  /*删除好友关系，单向删除*/
  void deleteFriend(String userId){
    SyClient.getInstance().contactManager().deleteFriend(userId: userId,callback: SyCallBack<bool>(onSuccess: (success){
      /*成功回调*/
    }, onFail: (code,msg){
      /*失败回调*/
    }));
  }
}