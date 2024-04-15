import 'package:flutter/material.dart';
import 'package:net_ninja_course/providers/filter_management.dart';
import 'package:provider/provider.dart';
import 'package:net_ninja_course/data/dummy_data.dart';
import 'package:net_ninja_course/screens/meals_screen.dart';
import "package:net_ninja_course/models/category.dart";
import 'package:net_ninja_course/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    FilterManagement filterManagement =
        Provider.of<FilterManagement>(context, listen: false);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  shouldShowTitle: true,
                  title: category.title,
                  meals: dummyMeals.where((meal) {
                    if (meal.categories.contains(category.id) &&
                        (filterManagement.isGlutenFreeSet ==
                            !meal.isGlutenFree)) {
                      return true;
                    }
                    if (meal.categories.contains(category.id) &&
                        (filterManagement.isLactoseFreeSet ==
                            !meal.isLactoseFree)) {
                      return true;
                    }
                    return false;
                  }).toList(),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            selectCategory: _selectCategory,
          )
      ],
    );
  }
}
