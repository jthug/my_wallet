import 'package:flutter/material.dart';

class DappPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DappPageState();
  }

}


class DappPageState extends State<DappPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("应用"),
        backgroundColor: Colors.green,
      ),
    );
  }

}