import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

    class ChatScreen extends StatefulWidget{
      @override
      State createState() => new ChatScreenState();
    }


    class ChatScreenState extends State<ChatScreen>with TickerProviderStateMixin{
      final List<ChatMessage> _messages = <ChatMessage>[];
      final TextEditingController _textController = new TextEditingController();
      bool _isComposing = false;
      bool _isFocusing = false;
      FocusNode _focusNode = FocusNode();

      void _handleSubmitted(String text) {   //发送消息
    _textController.clear();
    setState((){
      _isComposing = false;
      _isFocusing = false;
  });
      
  ChatMessage message = new ChatMessage(
    text:text,
    animationController:new AnimationController(
      duration:new Duration(milliseconds:300),
      vsync:this
    )
  );
  setState(() {
   _messages.insert(0,message); 
  });
  message.animationController.forward();
      }


  Widget _buildTextComposer() {      
              //************底部栏*************
    return new Container(
        alignment:Alignment.centerLeft,
        constraints: BoxConstraints.tightFor(width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.078),
        decoration: BoxDecoration(
          border: Border.all(color:Colors.grey,width: 0.25),
        ),

    child: new Row(
      children: [
        Expanded(
          flex:76266,
          child:new Container(
          alignment:Alignment.centerLeft,
          constraints: BoxConstraints.tightFor(width:MediaQuery.of(context).size.width*0.76533,height:MediaQuery.of(context).size.height*0.066), 
      decoration:ShapeDecoration(
        color: Colors.white54,
      shape:StadiumBorder(side:BorderSide(width:0.75,style: BorderStyle.solid,color: Colors.black54)),
      ),
      
      child:new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
      children:[
       new Flexible(
         child: TextField(   
        focusNode: _focusNode,                //*************文本输入框***************
        controller: _textController,
        textInputAction: TextInputAction.send,
        onTap: (){
          _isFocusing = true;
        },
        onChanged: (String text){
          setState((){
           _isComposing = text.length > 0;
           _isComposing = true;
          });
        },
        onSubmitted: _handleSubmitted,
        decoration: new InputDecoration.collapsed(hintText: ' 发送消息' ),
        ),
       ),
       new IconButton(
        icon:Icon(FontAwesomeIcons.microphone),
        color: _isFocusing?Colors.white:Colors.black,
        onPressed: () =>debugPrint('请对着麦克风说话'),
       ),
      ],
     ),
    ),
  ),
    
     Expanded(
       flex:23467,
     child:new Container(
      constraints: BoxConstraints.tightFor(width:MediaQuery.of(context).size.width*0.23467,height:MediaQuery.of(context).size.width*0.078),
       child:new Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         crossAxisAlignment: CrossAxisAlignment.center,
         children:[
            Icon(_isFocusing ? FontAwesomeIcons.microphone :FontAwesomeIcons.smile,
        color: Colors.black,),     
      Padding(padding:EdgeInsets.symmetric(vertical:0.0),
           child: Icon((_isFocusing ? FontAwesomeIcons.smile :FontAwesomeIcons.plus),
              color: Colors.black
           )
          )
         ],
        ),
      ),
     ),
    ],
   ), 
  );
  }
  @override
  void dispose(){
    for(ChatMessage message in _messages)
    message.animationController.dispose();
    super.dispose();
  }

      @override
      Widget build(BuildContext context){    
        
    return Scaffold(                                 //**************顶部栏***************
     appBar:PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.09884),
      child:AppBar(
        leading: IconButton(
          color: Colors.black,
          icon:Icon(Icons.arrow_back),
          tooltip:'返回',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
        IconButton(
          color: Colors.black,
          icon:Icon(Icons.search),
          tooltip:'查找',
          onPressed: () => debugPrint('查找'),
        ),
        ],
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.5,
        title: Text('石原里美',
        style:TextStyle(
          color:Colors.black,
          fontSize: 18.0
          ),
        ),
      ),  
    ),
    body:new Container(
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                 )
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(
                 color: Theme.of(context).cardColor, ),
            child: _buildTextComposer(),
          )
        ]
      ),
     )
    );
  }
}
class ChatMessage extends StatelessWidget { //************聊天气泡************/
       ChatMessage({this.text,this.animationController});
       
       final String text;
       final AnimationController animationController;
        @override
         Widget build(BuildContext context) {
        //final size = MediaQuery.of(context).size;
        //final width = size.width;
        //final height = size.height;
         return new Container(
          padding: EdgeInsets.fromLTRB(12.0, 4.0, 0.0, 0),
          margin:const EdgeInsets.symmetric(vertical:8.0),
            child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start, 
            mainAxisAlignment: MainAxisAlignment.end,
            
              children: <Widget>[
                new Flexible(
                  child: new Container(
                    
                    margin: const EdgeInsets.only(left: 20.0, right: 20),
                    padding: const EdgeInsets.all(8.0),
                    constraints: BoxConstraints(minHeight: 40.0,maxWidth:MediaQuery.of(context).size.width*0.587766,
                    ),
                  child: new Text(
                     text,
                     style: new TextStyle(fontSize: 20.0, ),
                      ),
                       decoration: new BoxDecoration(
                       border:new Border.all(color:Colors.grey,width: 1.5),
                       borderRadius: BorderRadius.circular(16.5)),
                      )
                    ),
                       new Container(
                         
                          height: 40,
                          width: 40,                                             
                          margin: EdgeInsets.fromLTRB(0,0,MediaQuery.of(context).size.width*0.0155039,0),
                             child: new CircleAvatar(
                           backgroundImage: NetworkImage(
                              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2652005857,601729128&fm=26&gp=0.jpg",
                           ),
                         ),
                       ),

                      ],
                    ),
                   );
                  }
                }



      /*class ChatMessage extends StatelessWidget { //************聊天气泡************/
       ChatMessage({this.text,this.animationController});
       final String text;
       final AnimationController animationController;
        @override
         Widget build(BuildContext context) {
         return new Container(
          padding: EdgeInsets.fromLTRB(12.0, 4.0, 8.0, 8.0),
          margin:const EdgeInsets.symmetric(vertical:8.0),
            child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start, 
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Flexible(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10),
                    padding: const EdgeInsets.all(8.0),
                    constraints: BoxConstraints(minHeight: 40.0,maxWidth:MediaQuery.of(context).size.width*0.587766,
                    ),
                  child: new Text(
                     text,
                     style: new TextStyle(fontSize: 20.0, ),
                      ),
                       decoration: new BoxDecoration(
                       border:new Border.all(color:Colors.grey,width: 1.5),
                       borderRadius: BorderRadius.circular(16.5)),
                      )
                    ),
                        new Container(
                          height: 40,
                          width: 40,
                             child: new CircleAvatar(
                           backgroundImage: NetworkImage(
                              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2652005857,601729128&fm=26&gp=0.jpg",
                           ),
                         ),
                       ),
                      ],
                    ),
                   );
                  }
                }
                */
                
