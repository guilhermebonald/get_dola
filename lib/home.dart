import 'dart:ui';
import 'package:dolaNow/controller/get_controller.dart';
import 'package:dolaNow/view/dolar_chart.dart';
import 'package:dolaNow/view/grid_coins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'view/dolar.dart';
import 'package:firebase_admob/firebase_admob.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Inicio da regra de negocio do Admob.
  String adIdInterstistial = "ca-app-pub-3098219905982691/4863343084";
  String appIdInterstistial = "ca-app-pub-3098219905982691~8994159780";

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    // testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>[
      'games',
      'gameplay',
      'market',
      'aliexpress',
      'roupas',
      'drones',
      'playstation',
      'xbox',
      'netshoes',
      'kabum'
    ],
    childDirected: true,
    nonPersonalizedAds: true,
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  int _coins = 0;

  BannerAd createBannerAd() {
    return BannerAd(
      //Test Id concedido pelo google Admob.
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: adIdInterstistial,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()..load();
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
        });
      }
    };
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    controller.setOneCoin();

    //AppBar().preferredSize.height; = tamanho da appbar se tiver.
    //MediaQuery.of(context).padding.top;  = tamanho da barra de notificações.
    var barHeigh = MediaQuery.of(context).padding.top;
    var widgetHeight = MediaQuery.of(context).size.height;
    var widgetWidth = MediaQuery.of(context).size.width;
    Color bgColor01 = Color(0xff141923);
    /* Color bgColor02 = Color(0xff262C35);
    Color bgGreen = Color(0xff21C17C);
 */

    return Scaffold(
      backgroundColor: bgColor01,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                //Background image\Bar.
                height: (widgetHeight - barHeigh) * 0.19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xff262C35),
                ),
                child: Row(
                  //Row com Logo e Text.
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 0, right: 15),
                      child: Container(
                        height: (widgetHeight - barHeigh) * 0.09,
                        width: widgetWidth * 0.17,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Title.png'),
                          ),
                          color: Color(0xff393e46),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        'Live Prices',
                        style: TextStyle(
                            fontFamily: 'Jaapokki',
                            fontSize: 32,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                //Row de botões.
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Container(
                      height: (widgetHeight - barHeigh) * 0.06,
                      width: widgetWidth * 0.5,
                      child: FittedBox(
                        child: IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.add_box,
                            color: Colors.redAccent,
                            size: 40,
                          ),
                          onPressed: () {
                            _interstitialAd?.dispose();
                            _interstitialAd = createInterstitialAd()..load();
                            _interstitialAd?.show();
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: GridCoin()),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: (widgetHeight - barHeigh) * 0.06,
                      width: widgetWidth * 0.5,
                      child: FittedBox(
                        child: IconButton(
                          icon: Icon(
                            Icons.bar_chart_rounded,
                            color: Colors.yellowAccent.withAlpha(210),
                            size: 40,
                          ),
                          onPressed: () {
                            _interstitialAd?.dispose();
                            _interstitialAd = createInterstitialAd()..load();
                            _interstitialAd?.show();
                            Navigator.push(
                              context,
                              PageTransition(
                                  child: Dchart(),
                                  type: PageTransitionType.bottomToTop),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //Container para conter PageView.
                height: (widgetHeight - barHeigh) * 0.5,
                width: double.infinity,
                padding: EdgeInsets.only(top: 5),
                child: Obx(
                  () => controller.dolarValue.value.isEmpty
                      ? Center(
                          child: Lottie.asset('assets/load.json',
                              width: 100, height: 100),
                        )
                      : buildCard(
                          context,
                          'Dólar Americano',
                          'US\$',
                          'R\$ ${double.parse(controller.dolarValue.value).toStringAsFixed(2)}',
                          Color(0xff331E36),
                          Color(0xff41337A),
                          () {
                            _interstitialAd?.dispose();
                            _interstitialAd = createInterstitialAd()..load();
                            _interstitialAd?.show();
                            Navigator.push(
                              context,
                              PageTransition(
                                  child: Dolar(),
                                  type: PageTransitionType.bottomToTop),
                            );
                          },
                          buildAssetImage(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCard(
  context,
  String moeda,
  String cod,
  String api,
  Color color1,
  Color color2,
  Function rota,
  Widget widgetImage,
) {
  return Container(
    margin: EdgeInsets.only(right: 10, left: 10),
    decoration: BoxDecoration(
      color: Color(0xff262C35),
      borderRadius: BorderRadius.circular(15),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 6),
              height: constraints.maxHeight * 0.15,
              width: constraints.maxWidth * 0.8,
              child: Container(
                height: constraints.maxHeight * 0.2,
                width: constraints.maxWidth * 0.6,
                child: FittedBox(
                  child: Text(
                    moeda,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Jaapokki',
                        fontSize: 23,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Divider(
              height: 6,
              thickness: 0.2,
              color: Colors.black.withOpacity(0.3),
            ),
            Container(
              height: constraints.maxHeight * 0.11,
              width: constraints.maxWidth * 0.3,
              child: FittedBox(
                child: Text(
                  cod,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto', fontSize: 5, color: Colors.white),
                ),
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.4,
              width: constraints.maxWidth * 0.6,
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 5,
              ),
              child: FittedBox(
                child: GradientText(
                  api,
                  gradient: LinearGradient(
                      colors: [Color(0xff21C17C), Color(0xff21C17C)]),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Jaapokki',
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                  onPressed: rota,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                      Icons.autorenew_rounded,
                      size: 35,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

Widget buildAssetImage() {
  return Image(
    image: AssetImage('assets/arrow.png'),
    color: Colors.white.withOpacity(0.4),
  );
}
