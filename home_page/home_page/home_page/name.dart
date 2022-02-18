import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  @override
  State createState() => new NameState();
}

class NameState extends State<Name> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child:Text(
                    "Root"
                  )
                ),
                Container(
                  color: Colors.brown,
                  child: Text(
                    "1.0k"
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.chat_bubble),
                  color: Colors.brown,
                  ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.add_circle),
                  color: Colors.brown,
                 )
              ],
            ),
            Text(
              "VINI VICI VIDI",
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          ],
        )
      )
    );
  }
}