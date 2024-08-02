import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tastify/models/meal_mod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier(): super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((meeal) => meeal.id != meal.id).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});