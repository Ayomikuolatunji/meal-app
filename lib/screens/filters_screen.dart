import 'package:flutter/material.dart';
import 'package:net_ninja_course/screens/tab_screen.dart';
import 'package:net_ninja_course/widgets/main_drawer.dart';

class FilterScreens extends StatefulWidget {
  const FilterScreens({super.key});

  @override
  State<FilterScreens> createState() {
    return _FilterScreensState();
  }
}

class _FilterScreensState extends State<FilterScreens> {
  bool isGlutenFreeSet = false;
  bool isLactoseFreeSet = false;
  bool isVegetarianFreeSet = false;
  bool isVegan = false;
  void onSetScreen(Identifier identifier) {
    Navigator.of(context).pop();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Preference"),
      ),
      drawer: MainDrawer(
        onSelectScreen: onSetScreen,
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: isGlutenFreeSet,
            onChanged: (value) {
              setState(() {
                isGlutenFreeSet = value;
              });
            },
            title: Text(
              "Gluten free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Only include gluten free meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: isLactoseFreeSet,
            onChanged: (value) {
              setState(() {
                isLactoseFreeSet = value;
              });
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Only include lactose free meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: isVegetarianFreeSet,
            onChanged: (value) {
              setState(() {
                isVegetarianFreeSet = value;
              });
            },
            title: Text(
              "Vegetarian free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Only include Vegetarian free meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: isVegan,
            onChanged: (value) {
              setState(() {
                isVegan = value;
              });
            },
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text("Only include vegan meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
