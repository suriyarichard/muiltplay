import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:muiltplay/screens/muiltplayer/main_menu_screen.dart';
import 'package:muiltplay/widgets/gameCard.dart';

class Allgames extends StatefulWidget {
  const Allgames({super.key});

  @override
  State<Allgames> createState() => _AllgamesState();
}

class _AllgamesState extends State<Allgames> {
  @override
  late BannerAd _topAd;
  bool _istopLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTopBannerAd();
  }

  void _initTopBannerAd() {
    _topAd = BannerAd(
      // adUnitId: 'ca-app-pub-5353304428164233/2915245904',
      adUnitId: 'a-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _istopLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            ad.dispose();
            print("ad failed to sho");
          });
        },
      ),
      request: AdRequest(),
    );
    _topAd.load();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "All Games",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGBs5zBdULlvWEJXCgMbl35byCAlOqi5w11UJAjLAs&s",
                // height: 150.0,
                // width: 300.0,
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8.0),
            //   ),
            //   child: Image.network(
            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGBs5zBdULlvWEJXCgMbl35byCAlOqi5w11UJAjLAs&s",
            //     // height: 150.0,
            //     // width: 100.0,
            //   ),
            //   //   // margin: const EdgeInsets.symmetric(horizontal: 16.0),
            //   //   height: 300,
            //   //   // width: 200,
            //   //   decoration: BoxDecoration(
            //   //     borderRadius: BorderRadius.circular(40),
            //   //     // image: const DecorationImage(
            //   //     //     image: NetworkImage(
            //   //     //         "https://assets8.lottiefiles.com/packages/lf20_V53nC8.json"),
            //   //     //     fit: BoxFit.cover
            //   //     //     ),
            //   //   ),
            //   //   child: Lottie.network(
            //   //       "https://assets8.lottiefiles.com/packages/lf20_V53nC8.json"),
            // ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/oxgame'),
                    child: gameCard(
                      icon:
                          'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
                      title: 'Tic Tac Toc',
                      color: Colors.indigoAccent,
                      fontColor: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, MainMenuScreen.routeName),
                    child: gameCard(
                      icon:
                          'https://assets10.lottiefiles.com/packages/lf20_2TNH9OeQxN.json',
                      title: 'Muilt player ',
                      color: Colors.indigoAccent,
                      fontColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gameCard(
                    icon:
                        'https://assets1.lottiefiles.com/packages/lf20_mcyr8uol.json',
                    title: 'coming soon...',
                    color: Colors.white,
                    fontColor: Colors.grey,
                  ),
                  gameCard(
                    icon:
                        'https://assets1.lottiefiles.com/packages/lf20_mcyr8uol.json',
                    title: 'coming soon...',
                    color: Colors.white,
                    fontColor: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // Container(
            //   child: AdWidget(ad: _topAd),
            //   height: _topAd.size.height.toDouble(),
            //   width: _topAd.size.width.toDouble(),
            // ),
          ]),
        ),
      ),
    );
  }
}
