import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appBanner {
  final int id;
  final String title;
  final String thumbUrl;

  appBanner(
    this.id,
    this.title,
    this.thumbUrl,
  );
}

List<appBanner> appBannerList = [
  appBanner(1, "suriya",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGBs5zBdULlvWEJXCgMbl35byCAlOqi5w11UJAjLAs&s"),
  appBanner(2, "suriya",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdN_XOv4fImXrfv8kwZtRItbYVyhXUvQWj1Q&usqp=CAU"),
  appBanner(3, "suriya",
      "https://img.freepik.com/free-vector/digital-neon-game-banner_1017-19897.jpg?w=2000"),
  // appBanner(3, "suriya", ""),
  // appBanner(4, "suriya", ""),
  // appBanner(5, "suriya", ""),
  // appBanner(6, "suriya", ""),
];
