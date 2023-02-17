import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muiltplay/provider/room_data_provider.dart';
import 'package:muiltplay/widgets/custom_textfield.dart';
import 'package:muiltplay/widgets/waitingCard.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
            // vertical: 10,
            horizontal: 10),
        width: 270,
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Waiting for a player to join...",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_2TNH9OeQxN.json'),
            const SizedBox(height: 30),
            CustomTextField(
              controller: roomIdController,
              hintText: '',
              isReadOnly: true,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Share the Id to Join",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15),
            ),
            ElevatedButton(
              onPressed: () async {
                final id = roomIdController.text;
                await Share.share(
                    "Join the game to play with me . Use this ID :   $id");
              },
              child: Icon(
                Icons.share,
                color: Colors.amber,
              ),
            )
            // GestureDetector(
            //   onTap: () async {
            //     final id = roomIdController;
            //     await Share.share("hello $id");
            //   },
            //   child: Icon(
            //     Icons.share,
            //     color: Colors.amber,
            //   ),
            // ),
          ],
        ),
      ),
    );
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Text('Waiting for a player to join...'),
    //       const SizedBox(height: 20),
    // CustomTextField(
    //         controller: roomIdController,
    //         hintText: '',
    //         isReadOnly: true,
    //       ),
    //     ],
    //   );
    // }
  }
}
