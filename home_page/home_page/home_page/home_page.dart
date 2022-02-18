import 'package:flutter/material.dart';
import 'flutter_screenutil.dart';

import 'background.dart';
import 'about_me.dart';
import 'hot_pot.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334) //1334
      ..init(context); // iphone6作为设计尺寸
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1334),
        child: Stack(
          children: <Widget>[
            // 上半部分
            Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(700), //600
              child: Container(
                child:
              Background(),
              ),
            ),
            // 下半部分
            Positioned(
              top: ScreenUtil().setHeight(100),
              child: Stack(
                children: <Widget>[
                  AboutMe(),
                  Positioned(
                    top: ScreenUtil().setHeight(690),
                    child: HotPot(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
