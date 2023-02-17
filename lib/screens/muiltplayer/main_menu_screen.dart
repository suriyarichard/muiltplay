import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:muiltplay/responsive/responsive.dart';
import 'package:muiltplay/screens/muiltplayer/create_room_screen.dart';
import 'package:muiltplay/screens/muiltplayer/join_room_screen.dart';
import 'package:muiltplay/widgets/custom_button.dart';
import 'package:muiltplay/widgets/custom_text.dart';
import 'package:muiltplay/widgets/gameCard.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({Key? key}) : super(key: key);

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 198, 207, 200),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ]),
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Play with your"),
            // const CustomText(
            //   text: 'Play with your',
            //   fontSize: 40,
            // ),
            // const CustomText(
            //   text: 'Friends!!😍',
            //   fontSize: 40,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [],
            // ),
            GestureDetector(
              onTap: () => createRoom(context),
              child: gameCard(
                icon:
                    'https://assets10.lottiefiles.com/packages/lf20_bD8Yze.json',
                title: 'Create a room',
                color: Colors.indigoAccent,
                fontColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => joinRoom(context),
              child: gameCard(
                icon:
                    'https://assets10.lottiefiles.com/packages/lf20_2TNH9OeQxN.json',
                title: 'Join Room',
                color: Color.fromARGB(255, 240, 142, 62),
                fontColor: Colors.white,
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: ElevatedButton(
            //     // onTap: () => createRoom(context),
            //     onPressed: () => createRoom(context),
            //     child: Text('Create Room ❤️'),
            //   ),
            // ),
            // // const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: ElevatedButton(
            //     // onTap: () => joinRoom(context),
            //     onPressed: () => joinRoom(context),
            //     child: Text('Join Room 💞'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
