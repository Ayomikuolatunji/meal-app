import 'package:flutter/material.dart';
import 'package:net_ninja_course/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.selectCategory});

  final Category category;

  final void Function(BuildContext context, Category category) selectCategory;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () => {selectCategory(context, category)},
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(0.555),
                category.color.withOpacity(0.555)
              ], begin: Alignment.topLeft, end: Alignment.topRight),
            ),
            child: Text(category.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
        ));
  }
}
