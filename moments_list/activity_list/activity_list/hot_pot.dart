import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routers/application.dart';

class HotPot extends StatefulWidget {
  @override
  _HotPotState createState() => _HotPotState();
}

class _HotPotState extends State<HotPot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1334),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      alignment: Alignment.topCenter,
      color: Colors.grey,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(50),
      //     topRight: Radius.circular(50),
      //   ),
      // ),
      child: Column(
        children: <Widget>[
          // _signature('VINI VICI VIDI'),
          // _title(),
          _listView(),
        ],
      ),
    );
  }

  // Widget _signature(String signature) {
  //   return Container(
  //     margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
  //     child: Text(
  //       signature,
  //       style: TextStyle(
  //         fontSize: ScreenUtil().setSp(32),
  //         color: Colors.black87,
  //       ),
  //     ),
  //   );
  // }

  // Widget _title() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20, left: 50, bottom: 10),
  //     alignment: Alignment.centerLeft,
  //     child: Text(
  //       'HOT POT',
  //       style: TextStyle(
  //         fontSize: ScreenUtil().setSp(40),
  //         color: Colors.black,
  //         fontWeight: FontWeight.w700,
  //       ),
  //     ),
  //   );
  // }

  Widget _icon(String url) {
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setWidth(100), // 两个都用setWidth确保不会变形
      margin: EdgeInsets.only(left: 20, right: 20),
      child: CircleAvatar(
        backgroundImage: AssetImage(url),
      ),
    );
  }

  Widget _userInfo(String name) {
    return Container(
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(40),
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _userInfoWithSignature(String name, String signature) {
    return Container(
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(40),
              color: Colors.black,
            ),
          ),
          Text(
            signature,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timestrap(String time) {
    return Container(
      height: ScreenUtil().setHeight(100),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
      alignment: Alignment.center,
      child: Text(
        time + '前',
        style: TextStyle(
          color: Colors.green.withOpacity(0.4),
          fontSize: ScreenUtil().setSp(24),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _news(String url) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/activity_list/news_content');
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: ScreenUtil().setWidth(670),
        child: Image.asset(
          url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _likeBtn() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(60),
            width: ScreenUtil().setWidth(60),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(60),
            width: ScreenUtil().setWidth(580),
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            alignment: Alignment.centerLeft,
            child: Text('Emma, Tony, Bsdb, Khfuyd, SFghytg...等18人赞了'),
          )
        ],
      ),
    );
  }

  Widget _talkBtn() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(60),
            height: ScreenUtil().setHeight(60),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.textsms,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(580),
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Column(
              children: <Widget>[
                _comment('Emma', 'resxg dfasdtas asdtqwa!'),
                _subComment('Tony', 'sabxzchlkj asijcl.'),
                _subComment('Jack', 'nxciowqr, cxiosfasd?'),
                _comment('David', 'qcnviu, wrqoinv.'),
                _comment('Elen', 'skadjcvxn.'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _comment(String name, String comment) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              name + ': ',
            ),
          ),
          Container(
            child: Text(
              comment,
            ),
          ),
        ],
      ),
    );
  }

  Widget _subComment(String name, String comment) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              name + ': ',
            ),
          ),
          Container(
            child: Text(
              comment,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialInfo() {
    return Container(
      width: ScreenUtil().setWidth(670),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _likeBtn(),
          _talkBtn(),
        ],
      ),
    );
  }

  // Widget _followers(List<String> urls) {
  //   return Container(
  //     width: ScreenUtil().setWidth(670),
  //     height: ScreenUtil().setHeight(150),
  //     margin: EdgeInsets.only(top: 10),
  //     child: GridView(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 10,
  //         mainAxisSpacing: 5.0,
  //         crossAxisSpacing: 5.0,
  //         childAspectRatio: 1.0,
  //       ),
  //       children: _getFollowers(urls),
  //     ),
  //   );
  // }
  //
  // List<Widget> _getFollowers(List<String> urls) {
  //   List<Widget> list = [];
  //   for (int i = 0; i < urls.length; i++) {
  //     list.add(
  //       Container(
  //         child: CircleAvatar(
  //           backgroundImage: AssetImage(
  //             urls[i],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   return list;
  // }

  Widget _listTile(
      String iconUrl, String name, String newsUrl, String time, bool isLeft,
      {String signature}) {
    if (isLeft) {
      return Container(
        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(20),
            bottom: ScreenUtil().setHeight(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _icon(iconUrl),
                    signature == null
                        ? _userInfo(name)
                        : _userInfoWithSignature(name, signature),
                    _timestrap(time),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Column(
                    children: <Widget>[
                      _news(newsUrl),
                      _socialInfo(),
                      // _followers(followers),
                    ],
                  ),
                ),
              ],
            ),
            // 底部横线
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   width: ScreenUtil().setWidth(700),
            //   height: ScreenUtil().setHeight(5),
            //   color: Colors.black12,
            // ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
          bottom: ScreenUtil().setHeight(20),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _icon(iconUrl),
                    signature == null
                        ? _userInfo(name)
                        : _userInfoWithSignature(name, signature),
                    _timestrap(time),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Column(
                    children: <Widget>[
                      _news(newsUrl),
                      _socialInfo(),
                      // _followers(followers),
                    ],
                  ),
                ),
              ],
            ),
            // 底部横线
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   width: ScreenUtil().setWidth(700),
            //   height: ScreenUtil().setHeight(5),
            //   color: Colors.black12,
            // ),
          ],
        ),
      );
    }
  }

  // List<String> followersUrl = [
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg',
  //   'static/images/activity_list/icon2.jpg'
  // ];

  Widget _listView() {
    return Container(
      // margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1224),
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          _listTile('static/images/activity_list/icon.jpg', 'Root',
              'static/images/activity_list/img.jpg', '15min', true),
          _listTile('static/images/activity_list/icon3.jpg', 'Sandel',
              'static/images/activity_list/img2.jpg', '17min', false),
        ],
      ),
    );
  }
}
