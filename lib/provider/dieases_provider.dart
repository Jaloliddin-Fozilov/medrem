import 'package:flutter/material.dart';

import '../models/diseas_model.dart';

class DiseasesProvider extends ChangeNotifier {
  final List<DiseasModel> _diseases = [
    DiseasModel(
      id: '01',
      title: 'Yuqori istma harorati',
      imageUrl: 'assets/images/virus.png',
      backgroundColor: const Color(0xfffff4fa),
    ),
    DiseasModel(
      id: '02',
      title: 'Shamollash',
      imageUrl: 'assets/images/corona.png',
      backgroundColor: const Color(0xffF7FFFF),
    ),
    DiseasModel(
      id: '03',
      title: 'Yuqori qon bosimi',
      imageUrl: 'assets/images/qon.png',
      backgroundColor: const Color(0xffFFFFF6),
    ),
    DiseasModel(
      id: '04',
      title: 'Yurak og’rig’i',
      imageUrl: 'assets/images/heart.png',
      backgroundColor: const Color(0xfffff4fa),
    ),
  ];

  List<DiseasModel> get diseases => [..._diseases];
}
