import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with TickerProviderStateMixin {
  // 组件接受垂直滑动手势时的偏移量
  double offsetDistance = 250.0;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, offsetDistance),
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1334),
        // padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(185, 145, 137, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: _verticalDragLine(),
            ),
            Positioned(
              left: 10.0,
              child: Container(
                margin: EdgeInsets.only(left: 30, top: 5),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 0.0),
                          height: 70.0,
                          width: 95.0,
                          decoration: new BoxDecoration(
                            border: Border.all(
                                color: Color(0xFF81BB23), width: 0.5), // 边色与边宽度
                            color: Colors.brown, // 底色
                            borderRadius:
                                new BorderRadius.circular((40.0)), // 圆角度
                          ),
                        ),
                        Positioned(
                           top:1.5,
                            left: 0.0,
                            child: GestureDetector(
                              //   onTap: () {
                              //     isForward ? controller1.reverse() : controller1.forward();
                              //     isForward ? controller2.reverse() : controller2.forward();
                              //     isForward ? controller3.reverse() : controller3.forward();
                              //     isForward ? controller4.reverse() : controller4.forward();
                              //     isForward = !isForward;
                              //  },
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "static/images/home_page/icon.jpg"),
                                radius: 33.5
                              ),
                            )),
                        Positioned(
                          //头像右侧关注数
                          left: 77.0,
                          top: 26.0,
                          child: Text(
                            'F',
                            style: TextStyle(
                              color: Color.fromRGBO(185, 145, 137, 1.0),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                    // Text(
                    //   //名字
                    //   'ABOUT ME',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 15.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   //个签
                    //   'Artist & designer',
                    //   style: TextStyle(
                    //     fontSize: 13.0,
                    //     color: Colors.grey,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 155.0,
              top: 5,
              child: Container(
                height: ScreenUtil().setHeight(140),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            "Root",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          
                          margin: EdgeInsets.only(left: 10,bottom: 20.0),
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(30),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            '1.0k',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        // IconButton(
                        //   onPressed: (){},
                        //   icon: Icon(Icons.chat_bubble),
                        //   color: Colors.brown,
                        // ),
                        // IconButton(
                        //   onPressed: (){},
                        //   icon: Icon(Icons.add_circle),
                        //   color: Colors.brown,
                        // )
                      ],
                    ),
                    // Text(
                    //   "VINI VICI VIDI",
                    //   textAlign: TextAlign.start,
                    //   style: TextStyle(color: Colors.white30),
                    // ),
                  ],
                ),
              ),
            ),

            // 个签
            Positioned(
              left: ScreenUtil().setWidth(90),
              top: ScreenUtil().setHeight(150),
              child: Container(
                child: Text(
                  '西梦里网络技术首席UI设计师',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(24),
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            Positioned(left: 70.0, top: 105.0, child: _text()),

            // Name(),

            //  Column(
            //   children: <Widget>[
            //     _verticalDragLine(), // 下滑提示横线
            //     Container(
            //       child:
            //     Avatar(),),
          ],
        ),
      ),
    );
  }

  // 下滑提示横线
  Widget _verticalDragLine() {
    return RawGestureDetector(
      gestures: {MyVerticalDragGestureRecognizer: getRecognizer()},
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1334),
        padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
        decoration: BoxDecoration(
          // color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
    );
  }

  // 标题栏
  // Widget _title() {
  //   return Container(
  //     alignment: Alignment.topLeft,
  //     child:
  //   );
  // }

  // 文字部分
  Widget _text() {
    return Container(
      width: ScreenUtil().setWidth(500),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum I',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(24),
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: 'Arial',
        ),
      ),
    );
  }

  // ---------------------------------------------------
  // 垂直滑动手势逻辑
  GestureRecognizerFactoryWithHandlers<MyVerticalDragGestureRecognizer>
      getRecognizer() {
    return GestureRecognizerFactoryWithHandlers(
        () => MyVerticalDragGestureRecognizer(), this._initializer);
  }

  void _initializer(MyVerticalDragGestureRecognizer instance) {
    instance
      ..onStart = _onStart
      ..onUpdate = _onUpdate
      ..onEnd = _onEnd;
  }

  ///接受触摸事件
  void _onStart(DragStartDetails details) {
    // print('触摸屏幕${details.globalPosition}');
  }

  ///垂直移动
  void _onUpdate(DragUpdateDetails details) {
    // print('垂直移动${details.delta}');
    // print('${offsetDistance}');
    offsetDistance = offsetDistance + details.delta.dy;
    setState(() {});

    // 垂直拖动超过下边界
    if (offsetDistance >= 250) {
      offsetDistance = 250;
    }
    // 垂直拖动超过上边界
    if (offsetDistance <= 0) {
      offsetDistance = 0;
    }
    setState(() {});
  }

  ///手指离开屏幕
  void _onEnd(DragEndDetails details) {
    // 下拉未过半，弹回顶部
    if (offsetDistance > 0 && offsetDistance <= 250 / 2) {
      offsetDistance = 0.0;
    }

    // 下拉过半，弹回底部
    if (offsetDistance > 250 / 2 && offsetDistance < 250) {
      offsetDistance = 250;
    }
    setState(() {});
    // print('离开屏幕');
  }
}

class MyVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {
  MyVerticalDragGestureRecognizer({Object debugOwner})
      : super(debugOwner: debugOwner);
}
