import 'package:flutter/material.dart';
import 'package:net_ninja_course/providers/favorites_management.dart';
import 'package:provider/provider.dart';
import "package:net_ninja_course/screens/meals_screen.dart";

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteMealsManagement>(
      builder: (context, favoriteMeals, child) {
        return MealsScreen(
          title: "Favorite",
          meals: favoriteMeals.favoriteMeals,
        );
      },
    );
  }
}
