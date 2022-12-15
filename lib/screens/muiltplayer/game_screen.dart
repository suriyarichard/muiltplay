import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:muiltplay/provider/room_data_provider.dart';
import 'package:muiltplay/resources/socket_methods.dart';
import 'package:muiltplay/views/scoreboard.dart';
import 'package:muiltplay/views/tictactoe_board.dart';
import 'package:muiltplay/views/waiting_lobby.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  late BannerAd _gameScreenAd;
  bool _gameLoaded = false;

  void _gameScreenBanner() {
    _gameScreenAd = BannerAd(
      // adUnitId: 'ca-app-pub-5353304428164233/2915245904',
      adUnitId: 'a-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _gameLoaded = true;
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
    _gameScreenAd.load();
  }

  @override
  void initState() {
    super.initState();
    _gameScreenBanner();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Scoreboard(),
                  const TicTacToeBoard(),
                  Text(
                    '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
                    style:
                        TextStyle(fontSize: 30, color: Colors.deepPurpleAccent),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: _gameLoaded
          ? Container(
              height: _gameScreenAd.size.height.toDouble(),
              width: _gameScreenAd.size.width.toDouble(),
              child: AdWidget(ad: _gameScreenAd),
            )
          : SizedBox(),
    );
  }
}
