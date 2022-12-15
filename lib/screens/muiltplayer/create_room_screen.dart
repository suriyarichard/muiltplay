import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:muiltplay/resources/socket_methods.dart';
import 'package:muiltplay/responsive/responsive.dart';
import 'package:muiltplay/widgets/custom_button.dart';
import 'package:muiltplay/widgets/custom_text.dart';
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
                // blurRadius: 40,
                // color: Colors.blue,
                // ),
                // ],
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your nickname',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                  onTap: () => _socketMethods.createRoom(
                        _nameController.text,
                      ),
                  text: 'Create'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _createLoaded
          ? Container(
              height: _createRoomScreen.size.height.toDouble(),
              width: _createRoomScreen.size.width.toDouble(),
              child: AdWidget(ad: _createRoomScreen),
            )
          : SizedBox(),
    );
  }
}
