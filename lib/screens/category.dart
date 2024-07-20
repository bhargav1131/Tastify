import 'package:flutter/material.dart';
import 'package:tastify/data/dummy.dart';
import 'package:tastify/models/category_mod.dart';
// import 'package:tastify/models/meal_mod.dart';
import 'package:tastify/screens/meals.dart';
import 'package:tastify/widgets/grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    // look upon this
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20), // the number of columns we want to have
        children: [
          for (final category in availableCategories)
            GridItem(category: category, onSelectCategory: (){
              _selectCategory(context, category);
            },)
        ],
      ),
    );
  }
}
