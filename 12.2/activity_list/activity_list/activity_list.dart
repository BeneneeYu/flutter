import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

// import './personal_information.dart';
import './hot_pot.dart';
import '../../routers/application.dart';
import '../../provide/message_list_provide.dart';

class ActivityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
      ..init(context); // iphone6作为设计尺寸
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            // // 背景
            // Container(
            //   width: ScreenUtil().setWidth(750),
            //   height: ScreenUtil().setHeight(1334),
            //   color: Color.fromRGBO(98, 140, 132, 1.0),
            // ),
            // // 顶部个人信息
            // Positioned(
            //   top: 35,
            //   child: PersonalInformation(),
            // ),
            // HOT POT
            Positioned(
              top: ScreenUtil().setHeight(100),
              child: HotPot(),
            ),
            // // 头像
            // Positioned(
            //   top: 40,
            //   left: 40,
            //   child: Container(
            //     width: ScreenUtil().setWidth(160),
            //     height: ScreenUtil().setWidth(160), // 两个都用setWidth确保不会变形
            //     child: CircleAvatar(
            //       backgroundImage: AssetImage('static/images/activity_list/icon.jpg'),
            //     ),
            //   ),
            // ),
            // 返回按钮
            // Positioned(
            //   top: ScreenUtil().setHeight(20),
            //   child: IconButton(
            //     onPressed: (){
            //       Navigator.pop(context);
            //     },
            //     icon: Icon(
            //       Icons.reply,
            //       color: Colors.black,
            //       size: ScreenUtil().setSp(60),
            //     ),
            //   ),
            // )，
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        //***********底部导航栏**********
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
          primaryColor: Colors.transparent,
        ),
        child: BottomAppBar(
          elevation: 0,
          // color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            constraints:
                BoxConstraints.tightFor(height: ScreenUtil().setHeight(120)),
            child: Container(
              margin: EdgeInsets.only(bottom: 8.0, left: 15.0, right: 15.0),
              constraints: BoxConstraints(maxHeight: 80.0, maxWidth: 360.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                    topRight: Radius.circular(80),
                    topLeft: Radius.circular(10),
                  ),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5.0),
                        blurRadius: 8.0)
                  ]),
              child: Row(
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(top: 4.0),
                    icon: Icon(Icons.chat_bubble_outline),
                    iconSize: 30,
                    color: Colors.grey,
                    onPressed: () {
                      Application.router
                          .navigateTo(context, '/message_list/message_list');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.home),
                    iconSize: 30,
                    color: Colors.grey,
                    onPressed: () {
                      Application.router
                          .navigateTo(context, '/home_page/home_page');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.green,
                    iconSize: 25,
                    onPressed: () {
                      Application.router
                          .navigateTo(context, '/activity_list/activity_list');
                    },
                  ),
                  GestureDetector(
                    onLongPress: () {
                      Provide.value<MessageListProvide>(context)
                          .showModalScreen();
                    },
                    onTap: () {
                      Application.router
                          .navigateTo(context, '/setting_page/setting_page');
                    },
                    child: Container(
                      //底部栏右侧头像
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(10, 0),
                            color: Colors.lightGreen,
                          )
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'static/images/setting_page/head_portrait.jpg'),
                          radius: 22,
                        ),
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
              ),
            ),
          ),
        ),
      ),
    );
  }
}
