import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoriesProvider extends ChangeNotifier {
  final List<CategoryModel> _categories = [
    CategoryModel(
      id: '1',
      title: 'Dietolog',
      icon: 'assets/images/dietolog.svg',
    ),
    CategoryModel(
      id: '2',
      title: 'Nevrolog',
      icon: 'assets/images/Brain.svg',
    ),
    CategoryModel(
      id: '3',
      title: 'Uyqu mutaxassisi',
      icon: 'assets/images/sleep.svg',
    ),
    CategoryModel(
      id: '4',
      title: 'Pediatr',
      icon: 'assets/images/pediatr.svg',
    ),
    CategoryModel(
      id: '5',
      title: 'Psixiatr',
      icon: 'assets/images/psixiatr.svg',
    ),
    CategoryModel(
      id: '6',
      title: 'Terapevt',
      icon: 'assets/images/terapevt.svg',
    ),
  ];

  List<CategoryModel> get categories => [..._categories];
}
