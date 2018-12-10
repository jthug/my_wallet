import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MarketPageState();
  }

}


class MarketPageState extends State<MarketPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("行情"),
        backgroundColor: Colors.green,
      ),
    );
  }
}