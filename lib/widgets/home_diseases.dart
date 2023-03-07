import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dieases_provider.dart';
import 'diseases_item.dart';

class HomeDiseases extends StatelessWidget {
  const HomeDiseases({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final diseasesProvider = Provider.of<DiseasesProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: diseasesProvider.diseases.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.47,
        ),
        itemBuilder: (BuildContext context, int index) {
          final diseas = diseasesProvider.diseases[index];
          return DiseasesItem(
            imageUrl: diseas.imageUrl,
            title: diseas.title,
            color: diseas.backgroundColor,
          );
        },
      ),
    );
  }
}
