import 'package:flutter/material.dart';
import 'package:net_ninja_course/models/grocery_item.dart';
import 'package:net_ninja_course/widgets/new_grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewGrocery()));
    if (newItem != null) {
      logger.d(newItem.name);
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void onDismissed(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
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
      body: _groceryItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Your List is empty, click plus icon to add new item"),
                  IconButton(
                      onPressed: () {
                        _addItem(context);
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: ((ctx, index) => Dismissible(
                    key: ValueKey(_groceryItems[index].id),
                    onDismissed: (value) {
                      onDismissed(_groceryItems[index]);
                    },
                    child: ListTile(
                      title: Text(_groceryItems[index].name),
                      leading: Container(
                        height: 24,
                        width: 24,
                        color: _groceryItems[index].category.color,
                      ),
                      trailing: Text(_groceryItems[index].quantity.toString()),
                    ),
                  ))),
    );
  }
}
