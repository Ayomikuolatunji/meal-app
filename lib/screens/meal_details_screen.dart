import 'package:flutter/material.dart';
import 'package:net_ninja_course/models/meal.dart';
import 'package:net_ninja_course/providers/favorites_management.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Consumer<FavoriteMealsManagement>(
          builder: (context, state, child) {
        var findMeal = state.favoriteMeals.cast<Meal?>().firstWhere(
            (book) => book?.title == meal.title,
            orElse: () => null);
        return Scaffold(
          appBar: AppBar(
            title: Text(meal.title),
            centerTitle: false,
            actions: [
              if (findMeal != null)
                IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(microseconds: 3000),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: animation,
                        child: child,
                      );
                    },
                    child: Icon(
                      Icons.star,
                      key: ValueKey(findMeal.id),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<FavoriteMealsManagement>(context, listen: false)
                        .removeRemoveFavoriteMeal(meal, context);
                  },
                )
              else
                IconButton(
                  onPressed: () {
                    Provider.of<FavoriteMealsManagement>(context, listen: false)
                        .addRemoveFavoriteMeal(meal, context);
                  },
                  icon: AnimatedSwitcher(
                    duration: const Duration(microseconds: 3000),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: animation,
                        child: child,
                      );
                    },
                    child: Icon(
                      Icons.star_border,
                      key: ValueKey(findMeal?.id),
                    ),
                  ),
                ),
            ],
          ),
          body: ListView(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                "Ingredients",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              // steps
              Text(
                "Steps",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              for (final step in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                )
            ],
          ),
        );
      });
    });
  }
}
