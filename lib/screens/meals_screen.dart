import 'package:flutter/material.dart';
import 'package:net_ninja_course/models/meal.dart';
import 'package:net_ninja_course/screens/meal_details_screen.dart';
import 'package:net_ninja_course/widgets/meal_item_widget.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final bool shouldShowTitle;
  final List<Meal> meals;
  const MealsScreen(
      {super.key,
      required this.meals,
      required this.title,
      required this.shouldShowTitle});

  void onSelectMeal(BuildContext context, Meal meal) {
    Navigator.push(context,
        MaterialPageRoute(builder: ((ctx) => MealDetailsScreen(meal: meal))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shouldShowTitle
          ? AppBar(
              centerTitle: false,
              title: Text(
                title,
                textAlign: TextAlign.left,
              ),
            )
          : null,
      body: meals.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "No meals",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Try selecting a new category",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: ((ctx, index) =>
                  MealItem(meal: meals[index], onSelectMeal: onSelectMeal)),
              itemCount: meals.length,
            ),
    );
  }
}
