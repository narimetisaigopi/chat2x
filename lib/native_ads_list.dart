import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
// ca-app-pub-3940256099942544/8135 179316
// ca-app-pub-3940256099942544~3347511713

class MyNativeAdsList extends StatefulWidget {
  @override
  _MyNativeAdsListState createState() => _MyNativeAdsListState();
}

class _MyNativeAdsListState extends State<MyNativeAdsList> {
  static String adUnitID = NativeAd.testAdUnitId;

  final _controller = NativeAdmobController();

  NativeAdmob nativeAd() {
    return NativeAdmob(
      adUnitID: adUnitID,
      controller: _controller,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget prepareList() {
    var list = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'a',
      'b',
      'c',
      'd',
      'e',
      'a',
      'b',
      'c',
      'd',
      'e'
    ];

    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          var tile = ListTile(
            title: Text("" + list[index]),
          );
          return Column(
            children: [
              index % 5 == 0
                  ? Container(
                      height: 100,
                      width: double.infinity,
                      child: nativeAd(),
                    )
                  : Container(
                      height: 0,
                      width: double.infinity,
                    ),
              tile
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("data"),
          ),
          body: prepareList()),
    );
  }

  dummyImagesList() {
    return ListView(
      children: <Widget>[
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2216727/pexels-photo-2216727.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/3119709/pexels-photo-3119709.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2847037/pexels-photo-2847037.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/3119709/pexels-photo-3119709.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 330,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 20.0),
          child: NativeAdmob(
            adUnitID: adUnitID,
            controller: _controller,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2216727/pexels-photo-2216727.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/3119709/pexels-photo-3119709.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          margin: EdgeInsets.only(bottom: 20.0),
          child: Image.network(
            "https://images.pexels.com/photos/2847037/pexels-photo-2847037.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
