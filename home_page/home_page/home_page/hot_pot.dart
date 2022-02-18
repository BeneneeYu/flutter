import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';

class HotPot extends StatefulWidget {
  @override
  _HotPotState createState() => _HotPotState();
}

class _HotPotState extends State<HotPot> with SingleTickerProviderStateMixin {
  // 显示全部文本内容按钮列表，在[主要内容区域模板]调用
  List<bool> showAllButtonIsClickList = [false, false];
  // 组件接受垂直滑动手势时的偏移量
  double offsetDistance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, offsetDistance),
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(734),
        // padding: EdgeInsets.fromLTRB(25, 5, 30, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Stack(
          children: <Widget>[
            // 下滑区域，覆盖在最底层
            _vertivalDragArea(), 
            // 顶部标题
            Positioned(
              top: ScreenUtil().setHeight(40),
              child: _title(),
            ),
            // 主要内容区域
            Positioned(
              top: ScreenUtil().setHeight(120),
              child: _mainArea(),
            ),
          ],
        ),
      ),
    );
  }

  // 下滑区域，覆盖在最底层
  Widget _vertivalDragArea() {
    return RawGestureDetector(
      gestures: {MyVerticalDragGestureRecognizer: getRecognizer()},
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(734),
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
  Widget _title() {
    return Container(
      width: ScreenUtil().setWidth(650),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 19.0),
            child: Text(
              'like a drunk in a midnignt choir',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Color.fromRGBO(121, 105, 105, 1),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   child: Text(
          //     'HISTORY',
          //     style: TextStyle(
          //       fontSize: ScreenUtil().setSp(60),
          //       color: Colors.black38,
          //       fontWeight: FontWeight.w800,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // 主要内容区域模板
  Widget _mainAreaTile(
      String timestamp, String text, String imgUrl, int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Container(
          //   child: CircleAvatar(
          //     backgroundImage: AssetImage("static/images/home_page/img1.jpg"),
          //     radius: ScreenUtil().setSp(35),
          //   ),
           ),
          // child: Text(
          //   '${timestamp}',
          //   style: TextStyle(
          //     fontSize: ScreenUtil().setSp(24),
          //     fontWeight: FontWeight.w600,
          //     color: Colors.black87,
          //   ),
          // ),

          Container(
            // 文本区域
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(6)),
                  width: ScreenUtil().setWidth(530),
                  child: Text(
                    '${text}',
                    textAlign: TextAlign.left,
                    maxLines: showAllButtonIsClickList[index] ? 10 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                // 箭头，显示全部内容
                // Container(
                //   width: ScreenUtil().setWidth(50),
                //   height: ScreenUtil().setHeight(50),
                //   child: IconButton(
                //     onPressed: () {
                //       setState(() {
                //         showAllButtonIsClickList[index] =
                //             !showAllButtonIsClickList[index];
                //       });
                //     },
                //     icon: Icon(
                //       showAllButtonIsClickList[index]
                //           ? Icons.keyboard_arrow_up
                //           : Icons.keyboard_arrow_down,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),

                // 图片区域
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: ScreenUtil().setWidth(550),
                  child: Image.asset(
                    '${imgUrl}',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 拼装主要区域
  Widget _mainArea() {
    return SingleChildScrollView(
      child: Container(
        width: ScreenUtil().setWidth(650),
        height: ScreenUtil().setHeight(600),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
        child: ListView(
          children: <Widget>[
            _mainAreaTile('in 5 min', 'VIVI LA VIDA',
                'static/images/home_page/img4.png', 0),
            _mainAreaTile('VIVI LA VIDA', 'VIVI LA VIDA',
                'static/images/home_page/img3.png', 1),
            // 为了使有下巴的手机也能看到完整的最后一条动态，在列表中添加一块空白区域
            Container(
              height: ScreenUtil().setHeight(200),
            )
          ],
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

  double widgetHeight = 220.0; // 最多下拉距离

  ///接受触摸事件
  void _onStart(DragStartDetails details) {
    // print('触摸屏幕${details.globalPosition}');
  }

  // 垂直移动
  void _onUpdate(DragUpdateDetails details) {
    // print('垂直移动${details.delta}');
    // print('${offsetDistance}');
    offsetDistance = offsetDistance + details.delta.dy;
    setState(() {});

    // 垂直拖动超过上边界
    if (offsetDistance <= 0) {
      offsetDistance = 0.0;
    }
    // 垂直拖动超过下边界
    if (offsetDistance >= widgetHeight) {
      offsetDistance = widgetHeight;
    }
    setState(() {});
  }

  ///手指离开屏幕
  void _onEnd(DragEndDetails details) {
    // 下拉未过半，弹回顶部
    if (offsetDistance > 0 && offsetDistance <= widgetHeight / 2) {
      offsetDistance = 0.0;
    }

    // 下拉过半，弹回底部
    if (offsetDistance > widgetHeight / 2 && offsetDistance < widgetHeight) {
      offsetDistance = widgetHeight;
    }
    setState(() {});
    // print('离开屏幕');
  }
}

class MyVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {
  MyVerticalDragGestureRecognizer({Object debugOwner})
      : super(debugOwner: debugOwner);
}
