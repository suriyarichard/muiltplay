import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:muiltplay/games/xo/tictco.dart';
import 'package:muiltplay/provider/room_data_provider.dart';
import 'package:muiltplay/screens/allGames.dart';
import 'package:muiltplay/screens/homescreen.dart';
import 'package:muiltplay/screens/muiltplayer/create_room_screen.dart';
import 'package:muiltplay/screens/muiltplayer/game_screen.dart';
import 'package:muiltplay/screens/muiltplayer/join_room_screen.dart';
import 'package:muiltplay/screens/muiltplayer/main_menu_screen.dart';
import 'package:muiltplay/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Game',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          '/allgames': ((context) => Allgames()),
          '/oxgame': ((context) => GameScreenHuman()),
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routeName: (context) => const GameScreen(),
          // '/Main': (context) => const MainMenuScreen(),
          //   '/d': (context) => const JoinRoomScreen(),
          //   '/dd': (context) => const CreateRoomScreen(),
          // '/ddd': (context) => const GameScreen(),
        },
      ),
    );
  }
}


// users reaches to my contents via google search engine include google ,bing or youtube channel .some traffic reaches via social also .