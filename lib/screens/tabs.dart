import 'package:flutter/material.dart';
import 'package:tastify/screens/category.dart';
import 'package:tastify/screens/filters.dart';
import 'package:tastify/screens/meals.dart';
import 'package:tastify/models/meal_mod.dart';
import 'package:tastify/widgets/main_drawer.dart';


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

  void _setScreen(String identifier) async{
    if(identifier == 'Filters'){
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx)=> const FiltersScreen()));
      
    } else{
      Navigator.of(context).pop();
    }
  }

  void _showClickMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void _toggleMealFavoriteStatus(Meal meal){
    final isExist = _favoriteMeals.contains(meal);

    if(isExist){
      setState(() {
        _favoriteMeals.remove(meal);
        _showClickMessage('Item has been removed from favorites');
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(meal);
        _showClickMessage('Item added to favorite');
      });
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
      activePage = MealsScreen(meals: _favoriteMeals, onToggleFavorites: _toggleMealFavoriteStatus,); 
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer:MainDrawer(
        onSelectScreen: _setScreen,
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