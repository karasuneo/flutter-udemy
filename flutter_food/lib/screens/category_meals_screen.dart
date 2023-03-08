import 'package:flutter/material.dart';

import 'package:flutter_food/models/meal.dart';
import 'package:flutter_food/widgets/meal_item.dart';



class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';

  late final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            affordability: displayMeals[index].affordability,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
