import 'package:flutter/material.dart';
import 'generate.dart';
import 'package:firebase_admob/firebase_admob.dart';


//App ID:
// ca-app-pub-4643104148474793~3453541923

//Banner ad id:
// ca-app-pub-4643104148474793/7201215246

//Interstitial Ad:
// ca-app-pub-4643104148474793/9228064041


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-4643104148474793~6394549971');
  runApp(MyApp());

  myBanner
  // typically this happens well before the ad is shown
    ..load()
    ..show(
      // Positions the banner ad 60 pixels from the bottom of the screen
      anchorOffset: 0.0,
      // Positions the banner ad 10 pixels from the center of the screen to the right
      horizontalCenterOffset: 0.0,
      // Banner Position
      anchorType: AnchorType.bottom,);

  myInterstitial
    ..load()
    ..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );

  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: Generator(),
    );
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['calendar', 'beautiful apps', 'best apps', 'fun', 'food', 'narendra modi', 'delhi', 'arvind kejriwal', 'bjp', 'aap','god', 'hindu', 'new year', 'flipkart', 'amazon', 'shopping', 'beauty', 'happy', 'instagram', 'web development', 'drink', 'tik tok', 'gym', 'cult', 'red bull', 'travel', 'study', 'sarkari', 'shopping','easy life', 'chill life', 'netflix','amazon', 'hotstar', 'cricker', 'bollywood'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: 'ca-app-pub-4643104148474793/7201215246',
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial = InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: 'ca-app-pub-4643104148474793/9228064041',
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);