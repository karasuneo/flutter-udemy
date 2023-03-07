import 'package:flutter/material.dart';
import 'package:flutter_food/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter';

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters!'),
      ),
    );
  }
}
