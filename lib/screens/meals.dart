import 'package:flutter/material.dart';
import 'package:tastify/models/meal_mod.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ,
    );
  }
}