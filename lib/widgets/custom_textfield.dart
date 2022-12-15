import 'package:flutter/material.dart';
import 'package:muiltplay/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.blue,
      //       blurRadius: 5,
      //       spreadRadius: 2,
      //     )
      //   ],
      // ),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: textC,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
