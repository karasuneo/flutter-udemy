import 'package:flutter/material.dart';
import 'package:flutter_food/category_item.dart';

import 'package:flutter_food/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisExtent: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(catData.title, catData.color))
          .toList(),
    );
  }
}
