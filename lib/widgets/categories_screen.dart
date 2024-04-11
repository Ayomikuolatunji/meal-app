import 'package:flutter/material.dart';
import 'package:net_ninja_course/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: const Text("Meal App"),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemBuilder: (ctx, index) => Dismissible(
                background: Container(
                  color: Colors.white10,
                ),
                key: ValueKey([index]),
                child: Text(availableCategories[index].title))));
  }
}
