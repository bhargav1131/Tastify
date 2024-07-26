import 'package:flutter/material.dart';
import 'package:tastify/models/meal_mod.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal, required this.onTogglefavorites});

  final void Function(Meal meal) onTogglefavorites;

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
              onTogglefavorites(meal);
            }, icon: const Icon(Icons.star),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
              Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15,),
            Text('Ingredients', 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
                ),
            ),
            const SizedBox(height: 15,),
        
            //displaying the ingredients to prepare the meal
            for(final ingredient in meal.ingredients)
              Text(ingredient, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 23,),
            Text('Steps', 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
                ),
            ),
        
            //displaying the steps to prepare the meal
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(step, textAlign: TextAlign.center ,style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                ),
                          ),
              ),
        
          ],
        ),
      ),
    );
  }
}
