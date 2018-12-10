import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TransferPageState();
  }
}

class TransferPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
      leading: InkWell(child:Icon(Icons.arrow_back),onTap: (){
        Navigator.of(context).pop();
      },),
      title: Text("转账"),
          backgroundColor: Colors.green,
    ));
  }
}
