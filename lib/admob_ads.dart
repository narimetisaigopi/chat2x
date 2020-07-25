import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat2x_new/native_ads_list.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdsScreens extends StatefulWidget {
  @override
  _AdsScreensState createState() => _AdsScreensState();
}

class _AdsScreensState extends State<AdsScreens> {
  @override
  void initState() {
    super.initState();
    createBannerAd()..load();
    createRewardVideoAd();
  }

  BannerAd createBannerAd() {
    return BannerAd(adUnitId: BannerAd.testAdUnitId, size: AdSize.smartBanner);
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      listener: (event) {
        Fluttertoast.showToast(msg: "createInterstitialAd event $event");
      },
    );
  }

  RewardedVideoAd createRewardVideoAd() {
    RewardedVideoAd.instance.load(
        adUnitId: RewardedVideoAd.testAdUnitId,
        targetingInfo: MobileAdTargetingInfo());
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        Fluttertoast.showToast(msg: "createRewardVideoAd : $event");
      }
    };
  }

  String adModImage =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Logo_de_Google_AdMob.png/800px-Logo_de_Google_AdMob.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 150,
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: adModImage,
              placeholder: (context, url) => Image.asset("assets/chat2x.jpeg"),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.yellow,
                    onPressed: () {
                      createBannerAd()
                        ..load()
                        ..show();
                    },
                    child: Text("Banner Ad"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.yellow,
                    onPressed: () {
                      createInterstitialAd()
                        ..load()
                        ..show();
                    },
                    child: Text("Interstitial Ad"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.yellow,
                    onPressed: () {
                      RewardedVideoAd.instance..show();
                    },
                    child: Text("Reward Ad"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    color: Colors.red,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    splashColor: Colors.yellow,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MyNativeAdsList()));
                    },
                    child: Text("Navitive Ads"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
