import 'package:flutter/cupertino.dart';

class DiseasModel {
  final String id;
  final String title;
  final String imageUrl;
  final Color backgroundColor;

  DiseasModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.backgroundColor,
  });
}
