import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'log_page.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance=ScreenUtil(width: 750.0,height: 1334.0)..init(context);
    return Scaffold(  
      body:SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.only(top:ScreenUtil().setHeight(50.0)),
          height: ScreenUtil().setHeight(1334.0),
          width: ScreenUtil().setWidth(750.0),
          child:Stack(children: <Widget>[
        LoginPage()
      ],))
      
    ));
  }
}
