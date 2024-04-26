import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:net_ninja_course/data/categories.dart';
import 'package:net_ninja_course/models/category.dart';
import 'package:net_ninja_course/models/grocery_item.dart';

var logger = Logger();

class NewGrocery extends StatefulWidget {
  const NewGrocery({super.key});

  @override
  State<NewGrocery> createState() => _NewGroceryState();
}

class _NewGroceryState extends State<NewGrocery> {
  final _formKey = GlobalKey<FormState>();
  String? _enteredName = "";
  Category? selectedCategory;
  String? _enteredQuantity = "";
  bool _isSending = false;
  Future saveItem() async {
    logger.d("Logger is working!");
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });
      _formKey.currentState!.save();
      final url = Uri.https("cic-website-f201d-default-rtdb.firebaseio.com",
          "shopping-lists.json");
      final res = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "name": _enteredName!,
            "quantity": int.tryParse(_enteredQuantity!)!,
            "category": selectedCategory?.title
          }));
      if (!context.mounted) {
        return;
      } else {
        if (res.statusCode == 200) {
          Navigator.of(context).pop(GroceryItem(
              name: _enteredName!,
              quantity: int.tryParse(_enteredQuantity!)!,
              id: DateTime.now().toString(),
              category: selectedCategory!));
          setState(() {
            _isSending = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length >= 50 ||
                      value.trim().length <= 1) {
                    return "Enter valid value";
                  }
                  return null;
                },
                onSaved: (value) => {_enteredName = value},
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter valid value and not null";
                        }
                        return null;
                      },
                      onSaved: (value) => {_enteredQuantity = value},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        setState(() {
                           _isSending = false;
                        });
                      },
                      child: const Text("Reset")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _isSending ? null : saveItem();
                      },
                      child: Text(_isSending == true ? "Sending..." : "Submit"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
