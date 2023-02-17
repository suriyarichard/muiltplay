import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:muiltplay/resources/socket_methods.dart';
import 'package:muiltplay/responsive/responsive.dart';
import 'package:muiltplay/utils/colors.dart';
import 'package:muiltplay/widgets/custom_button.dart';
import 'package:muiltplay/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:muiltplay/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  late BannerAd _createRoomScreen;
  bool condition = false;
  bool _createLoaded = false;

  void _createRoomBanner() {
    _createRoomScreen = BannerAd(
      // adUnitId: 'ca-app-pub-5353304428164233/2915245904',
      adUnitId: 'a-app-pub-3940256099942544/6300978111',

      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _createLoaded = true;
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
    _createRoomScreen.load();
  }

  @override
  void initState() {
    super.initState();
    _createRoomBanner();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
          ]),
      // backgroundColor: Colors.amber,
      body: Responsive(
        child: Container(
          padding: const EdgeInsets.symmetric(
              // vertical: 10,
              horizontal: 10),
          width: 300,
          height: 480,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          // margin: const EdgeInsets.symmetric(
          //   horizontal: 20,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Create Room",
                style: GoogleFonts.robotoMono(
                    fontSize: 30, color: Colors.indigoAccent),
                // TextStyle(fontSize: 40, color: Colors.amber),
              ),
              const Text(
                "Create & Share the Id to Join",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 15),
              ),
              SizedBox(
                height: 150,
                child: Lottie.network(
                    'https://assets7.lottiefiles.com/private_files/lf30_u0wepmmw.json'),
              ),
              // const CustomText(
              //   // shadows: [
              //   // Shadow(
              //   // blurRadius: 40,
              //   // color: Colors.blue,
              //   // ),
              //   // ],
              //   text: 'Create Room',
              //   fontSize: 70,
              // ),
              // SizedBox(height: size.height * 0.08),
              SizedBox(
                height: 20,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter your nickname",
                      style: GoogleFonts.robotoMono(
                          fontSize: 18, color: Colors.deepPurpleAccent)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    // width: double.infinity,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.green,
                      controller: _nameController,
                      // autofocus: true,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.pinkAccent),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Enter Name",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              // CustomTextField(
              //   controller: _nameController,
              //   hintText: 'Enter your nickname',
              // ),
              // SizedBox(height: size.height * 0.045),
              // GestureDetector(
              //   onTap: () => _socketMethods.createRoom(
              //     _nameController.text,
              //   ),
              //   child: Ink(
              //     decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [
              //             Color.fromARGB(255, 179, 8, 8),
              //             Color.fromARGB(255, 152, 156, 159)
              //           ],
              //           begin: Alignment.centerLeft,
              //           end: Alignment.centerRight,
              //         ),
              //         borderRadius: BorderRadius.circular(30.0)),
              //     child: Container(
              //       constraints:
              //           BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
              //       alignment: Alignment.center,
              //       child: Text(
              //         "Create",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(color: Colors.white, fontSize: 15),
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () => _socketMethods.createRoom(
                  _nameController.text,
                ),
                child: const Text('Create'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              // CustomButton(
              //     onTap: () => _socketMethods.createRoom(
              //           _nameController.text,
              //         ),
              //     text: 'Create'),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: _createLoaded
      //     ? Container(
      //         height: _createRoomScreen.size.height.toDouble(),
      //         width: _createRoomScreen.size.width.toDouble(),
      //         child: AdWidget(ad: _createRoomScreen),
      //       )
      //     : SizedBox(),
    );
  }
}
