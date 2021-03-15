import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(500),
      height: ScreenUtil().setHeight(150),
      margin: EdgeInsets.only(left: 150, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _personalInfo('Root', '1.6k'),
          // _signature('VINI VICI VIDI'),
        ],
      ),
    );
  }

  Widget _personalInfo(String name, String distance) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              name,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(60),
                color: Color.fromRGBO(203, 205, 205, 1.0),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: ScreenUtil().setWidth(60),
            height: ScreenUtil().setHeight(30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              distance,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Container(
          //   width: ScreenUtil().setWidth(60),
          //   height: ScreenUtil().setHeight(60),
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.chat_bubble,
          //       color: Colors.brown,
          //       size: ScreenUtil().setSp(40),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: ScreenUtil().setWidth(60),
          //   height: ScreenUtil().setHeight(60),
          //   child: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.add_circle,
          //       color: Colors.brown,
          //       size: ScreenUtil().setSp(40),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Widget _signature(String signature) {
  //   return Container(
  //     child: Text(
  //       signature,
  //       style: TextStyle(
  //         fontSize: ScreenUtil().setSp(32),
  //         color: Colors.black26,
  //       ),
  //     ),
  //   );
  // }
}
