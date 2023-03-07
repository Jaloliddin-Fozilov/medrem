import 'package:flutter/material.dart';

class DiseasesItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color color;
  const DiseasesItem({
    required this.imageUrl,
    required this.title,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              const Color(0xffffffff),
            ],
            stops: const [0.5, 0.5],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Row(
          children: [
            Image.asset(imageUrl),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
