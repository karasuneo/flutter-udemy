import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_food/models/meal.dart';
import 'package:flutter_food/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have favrites yet - start adding sime!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
