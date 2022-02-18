import 'package:flutter/material.dart';
import 'package:messagelist/chat_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '消息列表',
      home: new Scaffold(
        appBar: PreferredSize(
          child: AppBar(                      //**********顶部搜索栏***********
            elevation: 0.0,
          backgroundColor: Color(0xff),
                  actions: <Widget>[
           IconButton(
             padding: EdgeInsets.only(top: 20.0),
             icon: Icon(Icons.search),
             iconSize: 40.0,
             color: Colors.black,
             onPressed: ()=>{},
           ),
         ],

          title: new Container(   
                 
                                                                     //0.0591938125
        margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.041),     //0.9551724
        constraints: BoxConstraints.tightFor(width:MediaQuery.of(context).size.width*0.9551724,height:MediaQuery.of(context).size.height*0.054264),  //0.054264
        decoration:ShapeDecoration(
        color: Colors.grey[200],
        shape:StadiumBorder(side:BorderSide(width:0.75,style: BorderStyle.solid,color: Colors.black54))
          ),
           child: Text(
            '搜索',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0,
            color: Colors.grey[400],
            ),
           
            
            
             

           ) ,    
        ),
      ),
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.18), //0.11439
        ),
          
      
            body:Container(   
              // padding: EdgeInsets.only(top: 30.0),           //*****************消息列表*****************
              constraints: BoxConstraints.tightFor(height:MediaQuery.of(context).size.height*0.7),
              child:ListView.builder(
                itemCount: ChatModel.dummyData.length,
                itemExtent: 70,
                itemBuilder: (context, index) {
            ChatModel _model = ChatModel.dummyData[index];
            return Column(
              children: <Widget>[
                Container(
                constraints: BoxConstraints.tightFor(width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.1),
                  child:FlatButton(
                  padding: EdgeInsets.only(right: 5.0),
                 onPressed: () => {Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) =>new ChatScreen())
                    )
                    
                  },
                
                child:ListTile(
                  leading: CircleAvatar(
                    radius: 22.5,
                    backgroundImage: NetworkImage(_model.avatarUrl),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(_model.name,
                      style:TextStyle(
                    fontSize:18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                    ),
                    ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                  subtitle: Text(_model.message,
                  style:TextStyle(
                    fontSize:12.0,),
                    ),
                  trailing: Text(_model.time,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,),
                    ),
                ),                
                ),                
                ),
              ],
                
            );
          }
            )
            ),
          
          
       
          
  
     
      bottomNavigationBar: BottomAppBar(               //******** 底部导航栏********
        elevation: 0,
       child:new Container(
         constraints: BoxConstraints.tightFor(height:MediaQuery.of(context).size.height*0.078),
         decoration: BoxDecoration(
         borderRadius:BorderRadius.vertical(top: Radius.circular(90)),
         border: Border.all(color:Colors.grey,width: 0.4,),
          image: DecorationImage(
            image: NetworkImage('https://bpic.588ku.com/back_pic/05/71/40/065bab6b44ef7de.jpg'),              //底部导航栏背景图
            fit: BoxFit.cover,
          ),
        ),
       
        child:new Container(
         // margin: EdgeInsets.only(right: 20.0),
          
          constraints: BoxConstraints.tightFor(width:MediaQuery.of(context).size.width*0.25),
          
        
            
            child: Row(
    children: [
      IconButton(icon: Icon(Icons.home),
      iconSize: 40.0,
      onPressed: ()=>{},),
       IconButton(icon: Icon(Icons.business),
       iconSize: 40.0,
      onPressed: ()=>{},), 
      CircleAvatar(
        backgroundImage:NetworkImage('http://m.imeitou.com/uploads/allimg/2019031709/eoyjh4zwlxd.jpg'),
        radius: 22.5,
      ),
      IconButton(icon: Icon(Icons.calendar_today),
      iconSize: 40.0,
      onPressed: ()=>{},),
    ],
    mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
  ),
 
            
          
            
        
        
            
        
          
           ),
          ),
        )
      )
    );
    
  }
}


class ChatModel {                              //**********列表的信息内容 **************
  final String avatarUrl;
  final String name;
  final String message;
  final String time;
  ChatModel({this.avatarUrl, this.name,  this.message, this.time});

  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564211133&di=51937876058a25471d727c4d55ff521a&imgtype=jpg&er=1&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201712%2F29%2F20171229210959_HQjfU.thumb.700_0.jpeg",
      name: "石原里美",
      message: "在吗？",
      time:'1分钟前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565403883&di=88f586301dbc35a7efaf5ce3728a52cc&imgtype=jpg&er=1&src=http%3A%2F%2Fimgs.ali213.net%2Fnews%2F2019%2F07%2F05%2F2019070532302654.jpg",
      name: "Keanu Reeves",
      message: "你喜欢我的电影吗？",
      time: '5分钟前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564570726&di=de568e44f8f61f08da0dff08b9523056&imgtype=jpg&er=1&src=http%3A%2F%2Fimg3.qianzhan.com%2Fnews%2F201611%2F14%2F20161114-1bb6e24aeef0095d_600x5000.jpg",
      name: "Warren Buffett",
      message: "最近有什么好的股推荐吗？",
      time: '23分钟前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565402731&di=4282cef8fcc9bdd9103ca5742370c3d2&imgtype=jpg&er=1&src=http%3A%2F%2Fphotocdn.sohu.com%2F20120710%2FImg347747767.jpg",
      name: "Al Pacino",
      message: "zai ma",
      time: '39分钟前',
    ),
    ChatModel(
      avatarUrl: "http://s1.sinaimg.cn/mw690/001wXwxOzy76jiAfhKgc0&690",
      name: "Donald Trump",
      message: "你觉得我能连任吗？",
      time: '59分钟前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564570331&di=0754163d1afd393465dcf89d27a1d710&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.asiafinance.cn%2Fu%2Fcms%2Fwww%2F201705%2F0317045781db.jpg",
      name: "Jack Ma",
      message: "在吗？晚上能加个班吗？",
      time: '2小时前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564570381&di=79ee39a64ddf9b212fda014ba2e86d6f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg3.donews.com%2Fuploads%2Fimg3%2Fimg_pic_1499937013_1.png",
      name: "马化腾",
      message: "你觉得和平精英这名字咋样？",
      time: '1天前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565403759&di=6dde4e5b360a8884c3c11e4105da6d80&imgtype=jpg&er=1&src=http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F004kuxPAgy6UqLpFkJ826",
      name: "Bill Gates",
      message: "你知道哪里可以给我的surface换屏幕吗？",
      time: '1天前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564570430&di=9b5f8a045fecb089e2e9f21525aacf6c&imgtype=jpg&er=1&src=http%3A%2F%2Fwar.chinairn.com%2FUserFiles%2F20180322%2F20180322143604_4471.jpg",
      name: "Mark Zackburg",
      message: "你说我怎么赢阿里和腾讯？",
      time: '2天前',
    ),
    ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565403811&di=d16226d724614440576c5ebbcc0a9290&imgtype=jpg&er=1&src=http%3A%2F%2Fi0.sinaimg.cn%2Fty%2F2014%2F0612%2FU10623P6DT20140612160156.jpg",
      name: "Leronardo Dicapirio",
      message: "到时候我新片上映你记得来捧场。",
      time: '2天前',
    ),
     ChatModel(
      avatarUrl: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564570683&di=14a3846738f85f365e9b2f92e956ddf4&imgtype=jpg&er=1&src=http%3A%2F%2Fupload.mnw.cn%2F2016%2F0714%2F1468487604500.jpg",
      name: "Boris Johnson",
      message: "你赌我明天投票率多少？",
      time: '5天前',
    ),
     
    
  ];
}
         

