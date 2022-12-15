import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class waitingCard extends StatelessWidget {
  waitingCard({
    super.key,
    required this.title,
    required this.icon,
    // required this.color,
    // required this.fontColor
  });
  String title;
  String icon;
  // Color color = Colors.white;
  // Color fontColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          // vertical: 10,
          horizontal: 10),
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Lottie.network(icon),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
