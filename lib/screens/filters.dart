import 'package:flutter/material.dart';
import 'package:tastify/screens/tabs.dart';
import 'package:tastify/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState(){
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen>{
  var _glutenFreeFilterSet = false;

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
      body: Column(
        children: [
          SwitchListTile(
            value:  _glutenFreeFilterSet, 
            onChanged: (isChecked){
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            }, 
            title: Text('Gluten-free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,),
            ),
            subtitle: Text('only include gluten free meals', style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 33, right: 21),
          )
        ],
      ),
    );
  }
}