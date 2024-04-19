import 'package:flutter/material.dart';
import 'package:net_ninja_course/providers/filter_management.dart';
import 'package:provider/provider.dart';
import 'package:net_ninja_course/data/dummy_data.dart';
import 'package:net_ninja_course/screens/meals_screen.dart';
import "package:net_ninja_course/models/category.dart";
import 'package:net_ninja_course/widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(microseconds: 3000),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
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
        ),
        builder: (context, child) => SlideTransition(
              position: _animationController.drive(
                  Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))),
              child: child,
            ));
  }
}
