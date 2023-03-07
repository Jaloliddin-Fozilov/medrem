import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/categories_provider.dart';
import 'categories_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: categoryProvider.categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          final category = categoryProvider.categories[index];
          return CategoriesItem(
            title: category.title,
            icon: category.icon,
            onTap: () {},
          );
        },
      ),
    );
  }
}
