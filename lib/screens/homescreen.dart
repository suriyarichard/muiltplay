import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:muiltplay/models/appbanner.dart';
import 'package:muiltplay/screens/muiltplayer/main_menu_screen.dart';
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
                          // const Text(
                          //   'Suriya',
                          //   style: TextStyle(
                          //     fontSize: 18,
                          //     // color: Colors.indigo,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
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
                          color: Colors.black,
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
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
                          color: Colors.grey,
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
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, MainMenuScreen.routeName),
                      child: gameCard(
                        icon:
                            'https://assets3.lottiefiles.com/packages/lf20_dV7MKGn5cY.json',
                        title: 'Muilt player',
                        color: Colors.white,
                        fontColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Row(
              //     children: [
              //       ElevatedButton(
              //           onPressed: () {
              //             if (_inAdLoaded && counter == 3) {
              //               _interstitialAd.show();
              //               counter = 0;
              //             } else {
              //               counter++;
              //             }
              //           },
              //           // onPressed: () {
              //           //   if (_inAdLoaded) {
              //           //     _interstitialAd.show();
              //           //   }
              //           // },
              //           child: Text("Show ads"))
              //     ],
              //   ),
              // )
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
    );
  }
  // https://developers.google.com/android/reference/com/google/android/gms/ads/FullScreenContentCallback
}
