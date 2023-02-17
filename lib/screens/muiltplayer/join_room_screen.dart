import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:muiltplay/resources/socket_methods.dart';
import 'package:muiltplay/responsive/responsive.dart';
import 'package:muiltplay/widgets/custom_button.dart';
import 'package:muiltplay/widgets/custom_text.dart';
import 'package:muiltplay/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  late BannerAd _joinRoomAd;
  bool _joinLoaded = false;

  void _joinRoomBanner() {
    _joinRoomAd = BannerAd(
      // adUnitId: 'ca-app-pub-5353304428164233/2915245904',
      adUnitId: 'a-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _joinLoaded = true;
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
    _joinRoomAd.load();
  }

  @override
  void initState() {
    super.initState();
    _joinRoomBanner();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
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
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Join Room",
                style: GoogleFonts.robotoMono(
                    fontSize: 30, color: Colors.indigoAccent),
                // TextStyle(fontSize: 40, color: Colors.amber),
              ),
              const Text(
                "Get Id to Join",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 15),
              ),
              SizedBox(
                height: 150,
                child: Lottie.network(
                    'https://assets1.lottiefiles.com/packages/lf20_stbosmy7.json'),
              ),

              // SizedBox(height: size.height * 0.08),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter Game ID",
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
                      controller: _gameIdController,
                      // autofocus: true,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.pinkAccent),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Enter Game Id",
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
              // const SizedBox(height: 20),
              // CustomTextField(
              //   controller: _gameIdController,
              //   hintText: 'Enter Game ID',
              // ),
              // SizedBox(height: size.height * 0.045),
              // Container(
              //   height: 50.0,
              //   margin: EdgeInsets.all(10),
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     // style: RoundedRectangleBorder(
              //     //     borderRadius: BorderRadius.circular(80.0)),
              //     // padding: EdgeInsets.all(0.0),
              //     child: Ink(
              //       decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //             colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              //             begin: Alignment.centerLeft,
              //             end: Alignment.centerRight,
              //           ),
              //           borderRadius: BorderRadius.circular(30.0)),
              //       child: Container(
              //         constraints:
              //             BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
              //         alignment: Alignment.center,
              //         child: Text(
              //           "Gradient Button",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(color: Colors.white, fontSize: 15),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () => _socketMethods.joinRoom(
              //     _nameController.text,
              //     _gameIdController.text,
              //   ),
              //   child: Ink(
              //     decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              //           begin: Alignment.centerLeft,
              //           end: Alignment.centerRight,
              //         ),
              //         borderRadius: BorderRadius.circular(30.0)),
              //     child: Container(
              //       constraints:
              //           BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
              //       alignment: Alignment.center,
              //       child: Text(
              //         "Gradient Button",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(color: Colors.white, fontSize: 15),
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () => _socketMethods.joinRoom(
                  _nameController.text,
                  _gameIdController.text,
                ),
                child: const Text('Join'),
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
              //   onTap: () => _socketMethods.joinRoom(
              //     _nameController.text,
              //     _gameIdController.text,
              //   ),
              //   text: 'Join',
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _joinLoaded
          ? Container(
              height: _joinRoomAd.size.height.toDouble(),
              width: _joinRoomAd.size.width.toDouble(),
              child: AdWidget(ad: _joinRoomAd),
            )
          : SizedBox(),
    );
  }
}
