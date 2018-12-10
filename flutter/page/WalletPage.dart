import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'transfer/TransferPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WalletPageState();
  }
}

class WalletPageState extends State<WalletPage> with TickerProviderStateMixin{
  TextStyle ts = new TextStyle(color: Colors.white, fontSize: 18);
  TextStyle itemTs = new TextStyle(fontSize: 18);

  String eosAmount = "3.1415";

  String unit = "EOS";

  int count = 10;

  String more = "";

  bool isLoadingMore = false;

//  final items = new List<String>.generate(100, (i) => "Item $i");

  Widget getItem(BuildContext context, int position) {
    return new GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return new AlertDialog(
                  title: new Text("我是标题我最大"),
                  content: new Text("我是内容我最大$position"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("取消"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("确定"),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "住口！我说谁最大谁就最大",
                            bgcolor: "#000000",
                            textcolor: "#ffffff",
                            toastLength: Toast.LENGTH_LONG);
                        Navigator.of(context).pop();
                      },
                    )
                  ]);
            });
      },
      child: new Container(
        height: 80,
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/images/EOS.png",
                width: 30,
                height: 30,
              ),
              new Expanded(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("EOS"),
                          Text(
                            "99.99%",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                    ),
                    new Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("EOS"),
                            Text(
                              "99.99%",
                              style: TextStyle(color: Colors.redAccent),
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget getHead() {
    return new Container(
      color: Colors.green,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new InkWell(
                    child: Image.asset(
                      "assets/images/wallet_transaction.png",
                      width: 50,
                      height: 50,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransferPage()));
                    },
                    splashColor: Colors.black,
                  ),
                  Text(
                    "转账",
                    style: ts,
                  )
                ],
              ),
              new Column(
                children: <Widget>[
                  InkWell(
                    child: Image.asset(
                      "assets/images/wallet_receive.png",
                      width: 50,
                      height: 50,
                    ),
                    highlightColor: Colors.black,
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "点点点", textcolor: "#ffffff", bgcolor: "#000000");
                    },
                  ),
                  Text("收款", style: ts)
                ],
              ),
              new Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/wallet_vote.png",
                    width: 50,
                    height: 50,
                  ),
                  Text("投票", style: ts)
                ],
              ),
              new Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/wallet_resource.png",
                    width: 50,
                    height: 50,
                  ),
                  Text("资源管理", style: ts)
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "我的资产",
                  style: ts,
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Image.asset(
                    "assets/images/icon_eye.png",
                    width: 20,
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(eosAmount,
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(unit,
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  bool onNotify<Notification>(Notification n) {
//    if (n is! OverscrollNotification) {
//      return true;
//    }
//
    if (n is OverscrollNotification) {
      OverscrollNotification m = n;
      var metrics = m.metrics;
      var extentAfter = metrics.extentAfter;
      if (extentAfter == 0) {
//        loadMore(m);
//        setState(() {
//          more = "加载更多";
//        });
//        Future.delayed(new Duration(seconds: 2));
//        setState(() {
//          more = "";
//        });
      loadMore(m);
      }
    }
    return true;
  }

  void loadMore(OverscrollNotification m) {

    setState(() {
      count += 10;
    });
    Fluttertoast.showToast(msg: "加载更多");

  }

  getFoot() {

    if(isLoadingMore){
      return Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
        SpinKitFadingCircle(color: Colors.grey,size: 30,),
        Text("加载中...")
      ]);
    }else{
      return Text("");
    }

  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("钱包"),
        leading: Image.asset("assets/images/switch_wallet.png"),
        backgroundColor: Colors.green,
        actions: <Widget>[Image.asset("assets/images/btn_more.png")],
        elevation: 0,
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
              child: new Container(
            color: Colors.grey[150],
            child: NotificationListener(
              onNotification: onNotify,
              child: RefreshIndicator(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      delegate: SliverHeadDelegate(
                          child: getHead(), context: context),
                      pinned: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int position) {
                        return getItem(context, position);
                      }, childCount: count,
                      ),
                    ),
                    SliverPersistentHeader(delegate: SliverFootDelegate(child: getFoot(), context: context))
                  ],
                ),
                onRefresh: () {
                  setState(() {
                    count = 10;
                  });
                  return new Future.delayed(new Duration(seconds: 2));
                },
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class SliverFootDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  BuildContext context;


  SliverFootDelegate({@required this.child,@required this.context});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  // TODO: implement maxExtent
  @override
  double get maxExtent =>MediaQuery.of(context).size.height/20;

  // TODO: implement minExtent
  @override
  double get minExtent => MediaQuery.of(context).size.height/20;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}

class SliverHeadDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  BuildContext context;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  // TODO: implement maxExtent
  @override
  double get maxExtent => MediaQuery.of(context).size.height * 0.3;

  // TODO: implement minExtent
  @override
  double get minExtent => MediaQuery.of(context).size.height * 0.3;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  SliverHeadDelegate({
    @required this.child,
    @required this.context,
  });
}
