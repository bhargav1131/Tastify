import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tastify/models/meal_mod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier(): super([]);

  void _toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((meeal) => meeal.id != meal.id).toList();
    }else{
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider((ref){
  return FavoriteMealsNotifier();
});