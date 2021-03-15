import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  int index = 0;
  BottomNavBar(index) {
    this.index = index;
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
        primaryColor: Colors.transparent,
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          constraints:
              BoxConstraints.tightFor(height: ScreenUtil().setHeight(174)),
          child: Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(110),
              right: ScreenUtil().setWidth(110),
            ),
            constraints: BoxConstraints(
                maxHeight: ScreenUtil().setHeight(174),
                maxWidth: ScreenUtil().setWidth(1440)),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.chat_bubble),
                  iconSize: ScreenUtil().setSp(90),
                  color: index == 0 ? Colors.black : Colors.grey,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.import_contacts),
                  iconSize: ScreenUtil().setSp(90),
                  color: index == 1 ? Colors.black : Colors.grey,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  color: index == 2 ? Colors.black : Colors.grey,
                  iconSize: ScreenUtil().setSp(90),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: index == 3 ? Colors.black : Colors.grey,
                  iconSize: ScreenUtil().setSp(90),
                  onPressed: () {},
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            ),
          ),
        ),
      ),
    );
  }
}
