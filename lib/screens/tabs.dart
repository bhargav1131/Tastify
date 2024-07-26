import 'package:flutter/material.dart';
import 'package:tastify/screens/category.dart';
import 'package:tastify/screens/meals.dart';
import 'package:tastify/models/meal_mod.dart';


class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  @override
  State <TabScreen> createState(){
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen>{
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(Meal meal){
    final isExist = _favoriteMeals.contains(meal);

    if(isExist){
      _favoriteMeals.remove(meal);
    }
    else{
      _favoriteMeals.add(meal);
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToogleFav: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';

    if(_selectedPageIndex == 1)
    {
      activePage = MealsScreen(meals: [], onToggleFavorites: _toggleMealFavoriteStatus,); 
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
           BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}