import 'package:flutter/material.dart';
import 'package:muiltplay/responsive/responsive.dart';
import 'package:muiltplay/screens/muiltplayer/create_room_screen.dart';
import 'package:muiltplay/screens/muiltplayer/join_room_screen.dart';
import 'package:muiltplay/widgets/custom_button.dart';
import 'package:muiltplay/widgets/custom_text.dart';

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
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: 'Play with your',
              fontSize: 40,
            ),
            const CustomText(
              text: 'Friends!!😍',
              fontSize: 40,
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomButton(
                onTap: () => createRoom(context),
                text: 'Create Room ❤️',
              ),
            ),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CustomButton(
                onTap: () => joinRoom(context),
                text: 'Join Room 💞',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
