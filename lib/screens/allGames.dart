import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
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
                    color: Colors.white,
                    fontColor: Colors.grey,
                  ),
                  gameCard(
                    icon:
                        'https://assets3.lottiefiles.com/packages/lf20_7ehddyj8.json',
                    title: 'ENTERTAINMENT',
                    color: Colors.white,
                    fontColor: Colors.grey,
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
