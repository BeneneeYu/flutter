import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Stack(children: <Widget>[
              Container(
              height: ScreenUtil().setHeight(1334),
              width: ScreenUtil().setWidth(750.0),
              decoration: BoxDecoration(
              gradient:RadialGradient(
              colors:[
              Color.fromRGBO(79,125,112,0.8),
              Color.fromRGBO(55, 90, 83, 0.8),
              Color.fromRGBO(29, 52, 53, 0.9),
              Color.fromRGBO(17, 33, 35, 0.9),
              Color.fromRGBO(0, 4, 7,0.9)] ) ),
        ),
              ListView(
              padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(120.0)),
              children: <Widget>[
                SizedBox(
                  height:ScreenUtil().setHeight(160.0)
                ),
                buildTitle(),
                SizedBox(height:ScreenUtil().setHeight(80.0)),
                buildAccountText(context),
                buildEmailTextField(),
                SizedBox(height:ScreenUtil().setHeight(80.0)),
                buildPasswordText(context),
                buildPasswordTextField(context),
                SizedBox(height:ScreenUtil().setHeight(60.0)),
                buildLoginButton(context),
              ],
            )
            ],)
            ));
  }
  Align buildLoginButton(BuildContext context) {
    return Align(
      child:Column(children: <Widget>[
        SizedBox(
        height:ScreenUtil().setHeight(45.0),
        width:ScreenUtil().setWidth(270.0),
        child: IconButton(
          color: Colors.white,
          icon: Icon(IconData(0xf02c,fontFamily: 'CustomIcon'),
          size:ScreenUtil().setSp(60.0),),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              print('email:$_email , assword:$_password');
            }
          },
        ),
      ),
      ],)
    );
  }
  Container buildAccountText(BuildContext context)
  {
    return Container(
    alignment: Alignment.center,
    height:ScreenUtil().setHeight(140.0),
    child: Text('ACCOUNT',style: TextStyle(color:Colors.white,
    fontSize:ScreenUtil().setSp(45.0)),),);}
  Container buildPasswordText(BuildContext context)
  {
    return Container(
    alignment: Alignment.center,
    height:ScreenUtil().setHeight(140.0),
    child: Text('PASSWORD',style: TextStyle(color:Colors.white,
    fontSize: ScreenUtil().setSp(45.0)),),);}
  
 Container buildPasswordTextField(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height:ScreenUtil().setHeight(80.0),
      decoration: new BoxDecoration(
          border: new Border.all(
            color: Color.fromRGBO(209, 253, 245, 1),
             width:ScreenUtil().setWidth(2.0)),
          borderRadius: new BorderRadius.circular(15.0)),
      child:TextFormField(
      style:TextStyle(fontSize:ScreenUtil().setSp(45.0),color: Colors.white,fontWeight: FontWeight.w400,) ,
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) { }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Color.fromRGBO(209, 253, 245, 1),
             width:ScreenUtil().setWidth(3.0), 
             style: BorderStyle.solid)
        ),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    ),);
    
  }
  Container buildEmailTextField() {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(80.0),
      decoration: new BoxDecoration(
          border: new Border.all(
            color: Color.fromRGBO(209, 253, 245, 1),
             width:ScreenUtil().setWidth(2.0)),
          borderRadius: new BorderRadius.circular(15.0)),
      child:TextFormField(
        style:TextStyle(fontSize:ScreenUtil().setSp(45.0),color: Colors.white,fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color:  Color.fromRGBO(209, 253, 245, 1), 
          width:ScreenUtil().setWidth(3.0), style: BorderStyle.solid)
        ),
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
        }
      },
      onSaved: (String value) => _email = value,
    ));
  }
  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
      child: Center(child:Text(
        'LOG  IN',overflow: TextOverflow.fade,
        style: TextStyle(fontSize:ScreenUtil().setSp(100.0),
        color: Color.fromRGBO(209, 253,245,1)),
      ),
    ));
  }
}