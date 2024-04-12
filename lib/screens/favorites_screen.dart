import 'package:flutter/material.dart';
import 'package:net_ninja_course/providers/favorites_management.dart';
import 'package:provider/provider.dart';


class FavoritesScreen extends StatelessWidget {

 const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteMealsManagement>(
      builder: (context, favoriteMeals, child) {
        return  ListView.builder(
          itemCount: favoriteMeals.favoriteMeals.length,
          itemBuilder: (ctx, index) {
            final meal = favoriteMeals.favoriteMeals[index];
            return ListTile(
              title: Text(meal.title),
              onTap: () {
                // Use the provider function to add/remove favorite meal
                Provider.of<FavoriteMealsManagement>(context, listen: true)
                    .addRemoveFavoriteMeal(meal);
              },
            );
          },
        );
      },
    );
  }
}
