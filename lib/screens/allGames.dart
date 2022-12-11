import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:muiltplay/widgets/gameCard.dart';

class Allgames extends StatefulWidget {
  const Allgames({super.key});

  @override
  State<Allgames> createState() => _AllgamesState();
}

class _AllgamesState extends State<Allgames> {
  @override
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  gameCard(
                    icon:
                        'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
                    title: 'Tic Tac Toc',
                    color: Colors.indigoAccent,
                    fontColor: Colors.white,
                  ),
                  gameCard(
                    icon:
                        'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
                    title: 'ENTERTAINMENT',
                    color: Colors.indigoAccent,
                    fontColor: Colors.white,
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
                        'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
                    title: 'Tic Tac Toc',
                    color: Colors.indigoAccent,
                    fontColor: Colors.white,
                  ),
                  gameCard(
                    icon:
                        'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
                    title: 'ENTERTAINMENT',
                    color: Colors.indigoAccent,
                    fontColor: Colors.white,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
