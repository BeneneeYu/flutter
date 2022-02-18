import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body:Stack(
        children: <Widget>[
         Image.network("http://b.zol-img.com.cn/sjbizhi/images/10/1080x1920/157179487350.jpg"),
          Container(
            margin: EdgeInsets.only(left: 150, top: 210),
            //设置 child 居中
            alignment: Alignment(0, 0),
            height: 250,
            width: 250,
            //边框设置
            decoration: new BoxDecoration(
              //背景
              color: Colors.white,
              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              //设置四周边框
              border: new Border.all(width: 1, color: Colors.black),
            ),
            child: Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(35.0),
                ),
                new Text("账号：Emma" , style: new TextStyle(fontSize: 28.0),
          ),
                new Text("密码：            ",      style: new TextStyle(fontSize: 28.0)),
                new Padding(
                  padding: new EdgeInsets.all(11.0),
                ),
                  new Icon(
                    Icons.exit_to_app,
                      size: 50.0,
                      )]
                )
          ),
          Container(
              margin: EdgeInsets.only(left: 121, top: 367),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage('https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                      fit: BoxFit.cover
                  )
              )
          ),
          Container(
              margin: EdgeInsets.only(left: 144, top: 576),

              child:new Icon(
            Icons.fingerprint,
            size: 88.0,
          )
          )
        ]));}}
