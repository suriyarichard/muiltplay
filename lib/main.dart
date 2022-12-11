import 'package:flutter/material.dart';
import 'package:muiltplay/games/xo/tictco.dart';
import 'package:muiltplay/screens/allGames.dart';
import 'package:muiltplay/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/allgames': ((context) => Allgames()),
        '/oxgame': ((context) => GameScreen()),
      },
    );
  }
}
