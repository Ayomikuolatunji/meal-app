import 'package:flutter/material.dart';
import 'package:net_ninja_course/components/custom_snackbar.dart';
import 'package:net_ninja_course/models/meal.dart';

class FavoriteMealsManagement extends ChangeNotifier {
  final List<Meal> _favoriteMeals = [];
  List<Meal> get favoriteMeals => _favoriteMeals;

  void addRemoveFavoriteMeal(Meal meal, BuildContext context) {
    _favoriteMeals.add(meal);
    showSnackBar(context, "Added to favorites lists");
    notifyListeners();
  }

  void removeRemoveFavoriteMeal(Meal meal, BuildContext context) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      _favoriteMeals.remove(meal);
    }
    showSnackBar(context, "Removed from favorites lists");
    notifyListeners();
  }
}
