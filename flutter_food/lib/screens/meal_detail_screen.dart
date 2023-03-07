import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text('$mealId'),
          ),
          body: Center(
            child: Text('The meal! $mealId'),
          )),
    );
  }
}
