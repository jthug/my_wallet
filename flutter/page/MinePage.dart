import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MinePageState();
  }

}


class MinePageState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("我的"),
        backgroundColor: Colors.green,
      ),
    );
  }

}