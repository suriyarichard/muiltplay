import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                // shadows: [
                // Shadow(
                //   blurRadius: 40,
                //   color: Colors.blue,
                // ),
                // ],
                text: 'Join Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your nickname',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _gameIdController,
                hintText: 'Enter Game ID',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onTap: () => _socketMethods.joinRoom(
                  _nameController.text,
                  _gameIdController.text,
                ),
                text: 'Join',
              ),
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
