import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:muiltplay/models/appbanner.dart';
import 'package:muiltplay/widgets/gameCard.dart';
import 'package:muiltplay/widgets/indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  var counter = 0;
  late BannerAd _bannerAd;
  late BannerAd _topAd;
  bool _isAdLoaded = false;
  bool _istopLoaded = false;

  late InterstitialAd _interstitialAd;
  bool _inAdLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initBannerAd();
    // _initTopBannerAd();
    _initAd();
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            ad.dispose();
            print("ad failed to show");
          });
        },
      ),
      request: AdRequest(),
    );
    _bannerAd.load();
  }

  // void _initTopBannerAd() {
  //   _topAd = BannerAd(
  //     adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //     size: AdSize.banner,
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           _istopLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         setState(() {
  //           ad.dispose();
  //           print("ad failed to sho");
  //         });
  //       },
  //     ),
  //     request: AdRequest(),
  //   );
  //   _topAd.load();
  // }

  void _initAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        //     onAdLoaded: (ad) {
        //   _inAdLoaded = true;
        //   _interstitialAd = ad;

        //   _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        //       onAdDismissedFullScreenContent: (InterstitialAd ad) {
        //     print('ad dismissed');
        //     _interstitialAd.dispose();
        //   }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, adError) {
        //     print('ad failed');
        //     _interstitialAd.dispose();
        //   });
        // }, onAdFailedToLoad: (error) {
        //   _interstitialAd.dispose();
        // }),
        onAdFailedToLoad: (error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _inAdLoaded = true;

    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          _interstitialAd.dispose(),
      // print('%ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        _interstitialAd.dispose();
        print('$ad onAdDismissedFullScreenContent.');
        // ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        _interstitialAd.dispose();
        print('$ad onAdFailedToShowFullScreenContent: $error');
        // ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) => print('$ad impression occurred.'),
    );
    // _interstitialAd.fullScreenContentCallback = FullScreenAdLoadCallback();
    //   onAdDismissedFullScreenContent:(ad){
    //     _interstitialAd.dispose();
    //   }
    //   // onAdLoaded: (ad) {
    //   //   _interstitialAd.dispose();
    //   // },
    //   // onAdFailedToLoad: (ad, error) {
    //   //   _interstitialAd.dispose();
    //   // },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(
                        Icons.grid_view_rounded,
                        // color: Colors.,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Suriya',
                            style: TextStyle(
                              fontSize: 18,
                              // color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Lottie.network(
                              ("https://assets6.lottiefiles.com/packages/lf20_kqwv43zp.json"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome to game world !!!",
                      style: TextStyle(
                          // color: Colors.grey[500],
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                height: 150,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    itemCount: appBannerList.length,
                    itemBuilder: ((context, index) {
                      var banner = appBannerList[index];
                      var _scale = _selectedIndex == index ? 1.0 : 0.8;
                      return TweenAnimationBuilder(
                        duration: Duration(microseconds: 350),
                        tween: Tween(begin: _scale, end: _scale),
                        builder: (BuildContext context, double value,
                            Widget? child) {
                          return Transform.scale(scale: value, child: child);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image:
                                    NetworkImage(appBannerList[index].thumbUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    })),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    appBannerList.length,
                    (index) => Indicator(
                        isActive: _selectedIndex == index ? true : false),
                  )
                ],
              ),
              // next
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Games",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/allgames'),
                          child: Text(
                            'see all',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/oxgame'),
                      child: gameCard(
                        icon:
                            'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
                        title: 'Tic Tac Toc',
                        color: Colors.white,
                        fontColor: Colors.grey,
                        // color: Colors.indigoAccent,
                        // fontColor: Colors.white,
                      ),
                    ),
                    gameCard(
                      icon:
                          'https://assets3.lottiefiles.com/packages/lf20_dV7MKGn5cY.json',
                      title: 'Loading!!...',
                      color: Colors.white,
                      fontColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (_inAdLoaded && counter == 3) {
                            _interstitialAd.show();
                            counter = 0;
                          } else {
                            counter++;
                          }
                        },
                        // onPressed: () {
                        //   if (_inAdLoaded) {
                        //     _interstitialAd.show();
                        //   }
                        // },
                        child: Text("Show ads"))
                  ],
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       gameCard(
              //         icon:
              //             'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
              //         title: 'Tic tac toc',
              //         color: Colors.indigoAccent,
              //         fontColor: Colors.white,
              //       ),
              //       gameCard(
              //         icon:
              //             'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
              //         title: 'Tic tac toc',
              //         color: Colors.indigoAccent,
              //         fontColor: Colors.white,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _isAdLoaded
          ? Container(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : SizedBox(),
    );
  }
}
