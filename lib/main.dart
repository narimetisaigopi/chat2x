import 'package:chat2x_new/admob_ads.dart';
import 'package:chat2x_new/constants.dart';
import 'package:chat2x_new/home_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  FirebaseAdMob.instance.initialize(appId: Constants.admobID);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat2X App Building",
      home: AdsScreens(),
    );
  }
}
