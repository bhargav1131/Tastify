import 'package:flutter/material.dart';
import 'package:tastify/data/dummy.dart';
import 'package:tastify/models/category_mod.dart';
import 'package:tastify/models/meal_mod.dart';
import 'package:tastify/screens/meals.dart';
import 'package:tastify/widgets/grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToogleFav, required this.availableMeals});

  final void Function(Meal meal) onToogleFav;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    // look upon this
    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals,onToggleFavorites: onToogleFav ,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
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
    );
  }
}
