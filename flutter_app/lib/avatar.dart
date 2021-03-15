import 'package:flutter/material.dart';
import 'flutter_screenutil.dart';

class Avatar extends StatefulWidget {
  @override
  State createState() => new AvatarState();
}

class AvatarState extends State<Avatar> with TickerProviderStateMixin {
  AnimationController controller1;
  AnimationController controller2;
  AnimationController controller3;
  AnimationController controller4;
  AnimationController controller5;
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;
  Animation<double> animation4;
  Animation<double> animation5;

  CurvedAnimation curve;
  bool isForward = false;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
        duration: const Duration(milliseconds:100), vsync: this);
    curve = CurvedAnimation(parent: controller1, curve: Curves.linear);
    animation1 = Tween(begin: 0.0, end: 45.0).animate(controller1);
    animation1.addListener(() {
      setState(() {});
    });

    controller2 = AnimationController(
        duration: const Duration(milliseconds:1), vsync: this);
    curve = CurvedAnimation(parent: controller2, curve: Curves.fastOutSlowIn);
    animation2 = Tween(begin: 112.0, end: 84.0).animate(controller2);
    animation2.addListener(() {
      setState(() {});
    });

    controller3 = AnimationController(
        duration: const Duration(milliseconds:1), vsync: this);
    curve = CurvedAnimation(parent: controller3, curve: Curves.linear);
    animation3 = Tween(begin: 0.0, end: 45.0).animate(controller3);
    animation3.addListener(() {
      setState(() {});
    });

     controller4 = AnimationController(
        duration: const Duration(milliseconds:1), vsync: this);
    curve = CurvedAnimation(parent: controller4, curve: Curves.linear);
    animation4 = Tween(begin: 22.0, end: 0.0).animate(controller4);
    animation4.addListener(() {
      setState(() {});
    });
 }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          Stack(
                children: <Widget>[
                  Container(
                  margin: EdgeInsets.only(left:animation3.value),
                 height: 84.0,
                 width: animation2.value,
                  decoration: new BoxDecoration(
                  border: Border.all(color: Color(0xFF81BB23), width: 0.5), // 边色与边宽度
                  color: Color(0xFF81BB23), // 底色
                    borderRadius: new BorderRadius.circular((40.0)), // 圆角度
                  ),
                  ),
                  Positioned(
                    left: animation1.value,
                    child:GestureDetector(
                      onTap: () {
                        isForward ? controller1.reverse() : controller1.forward();
                        isForward ? controller2.reverse() : controller2.forward();
                        isForward ? controller3.reverse() : controller3.forward();
                        isForward ? controller4.reverse() : controller4.forward();
                        isForward = !isForward;
                     },
                      child: CircleAvatar(
                        backgroundImage:  AssetImage("assets/images/home_page/img1.jpg"),
                        radius: 42.0,
                        ),
                      )
                    ),

                  Positioned(  //头像右侧关注数
                    left:90.0,
                    top:35.0,
                    child:
                      Text(        
                       'F',
                        style: TextStyle(
                         fontSize:animation4.value, 
                        fontWeight: FontWeight.bold,
                      ),
                    textAlign: TextAlign.left,
                  ),
                  )
                ]
              ),

                  Text(             //名字
                    'ABOUT ME',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(                  //个签
                    'Artist & designer',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ]
            ),
           );
  }

          
              
          
          
  }