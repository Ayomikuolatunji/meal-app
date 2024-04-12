import 'package:flutter/material.dart';
import 'package:net_ninja_course/models/meal.dart';

class FavoriteMealsManagement extends ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  void addRemoveFavoriteMeal(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }
}
