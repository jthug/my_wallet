import 'package:flutter/material.dart';

import 'page/MinePage.dart';
import 'page/WalletPage.dart';
import 'page/MarketPage.dart';
import 'page/DappPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '钱包',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: PageContainer(title: '钱包'),
    );
  }
}

class PageContainer extends StatefulWidget {
  PageContainer({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  PageContainerState createState() => PageContainerState();
}

class PageContainerState extends State<PageContainer> {

  static int tabIndex = 0;
  static List tabImages = [
    [getImage("assets/images/icon1.png"), getImage("assets/images/icon11.png")],
    [getImage("assets/images/icon2.png"), getImage("assets/images/icon22.png")],
    [getImage("assets/images/icon3.png"), getImage("assets/images/icon33.png")],
    [getImage("assets/images/icon4.png"), getImage("assets/images/icon44.png")]
  ];

  List<Widget> bodys =[new WalletPage(),new MarketPage(),new DappPage(),new MinePage()];

  static Image getIcon(index) {
    if (tabIndex == index) {
      return tabImages[index][1];
    }
    return tabImages[index][0];
  }

  static Image getImage(String path) {
    return Image.asset(
      path,
      width: 30,
      height: 30,
    );
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: bodys[tabIndex]
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: getIcon(0), title: Text("钱包"), backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: getIcon(1), title: Text("行情"), backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: getIcon(2), title: Text("应用"), backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: getIcon(3), title: Text("我的"), backgroundColor: Colors.white),
        ],
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        onTap: (index){
         setState(() {
           tabIndex = index;
         });
        },
      ),
    );
  }
}
