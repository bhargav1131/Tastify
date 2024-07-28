import 'package:flutter/material.dart';
import 'package:tastify/screens/tabs.dart';
import 'package:tastify/widgets/main_drawer.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState(){
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen>{
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(onSelectScreen: (identifier){
        Navigator.of(context).pop();
        if(identifier == 'Meals'){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const TabScreen()));
        }
      }),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree : _glutenFreeFilterSet,
            Filter.lactoseFree : _lactoseFreeFilterSet,
            Filter.vegetarian : _vegetarianFilterSet,
            Filter.vegan : _veganFilterSet,
         });
        },

        child: Column(
          children: [
            SwitchListTile(
              value:  _glutenFreeFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              }, 
              title: Text('Gluten Free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              subtitle: Text('only include gluten free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 21),
            ),
        
            SwitchListTile(
              value:  _lactoseFreeFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              }, 
              title: Text('Lactose Free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              subtitle: Text('only include lactose free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 21),
            ),
        
            SwitchListTile(
              value:  _vegetarianFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              }, 
              title: Text('Vegetarian', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              subtitle: Text('only include vegetarian meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 21),
            ),
        
            SwitchListTile(
              value:  _veganFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
              }, 
              title: Text('Vegan', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              subtitle: Text('only include vegan meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 33, right: 21),
            ),
          ],
        ),
      ),
    );
  }
}