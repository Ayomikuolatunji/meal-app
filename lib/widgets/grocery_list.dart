import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:net_ninja_course/data/categories.dart';
import 'package:net_ninja_course/models/category.dart';
import 'package:net_ninja_course/models/grocery_item.dart';
import 'package:net_ninja_course/widgets/new_grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];

  void loadGroceryItems() async {
    final url = Uri.https(
        "cic-website-f201d-default-rtdb.firebaseio.com", "shopping-lists.json");
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    logger.d(responseData);
    final List<GroceryItem> fetchedData = [];
    for (final grocery in responseData.entries) {
      final Category category = categories.entries
          .firstWhere(
              (category) => category.value.title == grocery.value["category"])
          .value;
      fetchedData.add(GroceryItem(
          id: grocery.key,
          name: grocery.value["name"],
          quantity: grocery.value["quantity"],
          category: category));
    }
    setState(() {
      _groceryItems = fetchedData;
    });
  }

  @override
  void initState() {
    loadGroceryItems();
    super.initState();
  }

  void _addItem(BuildContext context) async {
    await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewGrocery()));
    loadGroceryItems();
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
