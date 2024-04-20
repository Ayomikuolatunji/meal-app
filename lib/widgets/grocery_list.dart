import 'package:flutter/material.dart';
import 'package:net_ninja_course/data/dummy_items.dart';
import 'package:net_ninja_course/models/grocery_item.dart';
import 'package:net_ninja_course/widgets/new_grocery.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  Future _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewGrocery()));

    logger.d(newItem?.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your groceries"),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                _addItem(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: ((ctx, index) => ListTile(
                title: Text(groceryItems[index].name),
                leading: Container(
                  height: 24,
                  width: 24,
                  color: groceryItems[index].category.color,
                ),
                trailing: Text(groceryItems[index].quantity.toString()),
              ))),
    );
  }
}
