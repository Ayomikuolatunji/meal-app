import 'package:flutter/material.dart';
import 'package:net_ninja_course/models/filter.dart';

class FilterManagement extends ChangeNotifier {
  bool isGlutenFreeSet = true;
  bool isLactoseFreeSet = true;
  bool isVegetarianFreeSet = true;
  bool isVegan = true;

  List<FilterModel> filters = [
    FilterModel(
        subTitle: "Only include gluten free meals",
        title: "Gluten free",
        value: false),
    FilterModel(
        subTitle: "Only include lactose free meals",
        title: "Lactose free",
        value: false),
    FilterModel(
        subTitle: "Only include lactose free meals",
        title: "Vegetarian free",
        value: false),
    FilterModel(
        subTitle: "Only include vegan meals", title: "Vegan free", value: false)
  ];

  void toggleFilter(String filterName) {
    switch (filterName) {
      case "Gluten free":
      print(isGlutenFreeSet);
        isGlutenFreeSet = !isGlutenFreeSet;
        break;
      case "Lactose free":
        isLactoseFreeSet = !isLactoseFreeSet;
        break;
      case "Vegetarian free":
        isVegetarianFreeSet = !isVegetarianFreeSet;
        break;
      case "Vegan free":
        isVegan = !isVegan;
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
