import 'package:flutter/material.dart';

import 'package:net_ninja_course/providers/filter_management.dart';
import 'package:net_ninja_course/screens/tab_screen.dart';
import 'package:net_ninja_course/widgets/main_drawer.dart';
import "package:net_ninja_course/widgets/filter_widget.dart";
import 'package:provider/provider.dart';

class FilterScreens extends StatefulWidget {
  const FilterScreens({super.key});

  @override
  State<FilterScreens> createState() {
    return _FilterScreensState();
  }
}

class _FilterScreensState extends State<FilterScreens> {
  void onSetScreen(Identifier identifier) {
    Navigator.of(context).pop();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Consumer<FilterManagement>(builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Filter Preference"),
          ),
          drawer: MainDrawer(
            onSelectScreen: onSetScreen,
          ),
          body: Column(
            children: [
              for (final filter in state.filters)
                FilterWidget(
                  value: filter.title == "Gluten free"
                      ? state.isGlutenFreeSet
                      : filter.title == "Lactose free"
                          ? state.isLactoseFreeSet
                          : filter.title == "Vegetarian free"
                              ? state.isVegetarianFreeSet
                              : state.isVegan,
                  title: filter.title,
                  subTitle: filter.subTitle,
                  onChange: (value) {
                    switch (filter.title) {
                      case "Gluten free":
                        Provider.of<FilterManagement>(context, listen: false)
                            .toggleFilter('Gluten free');
                        break;
                      case "Lactose free":
                        Provider.of<FilterManagement>(context, listen: false)
                            .toggleFilter('Lactose free');
                        break;
                      case "Vegetarian free":
                        Provider.of<FilterManagement>(context, listen: false)
                            .toggleFilter('Vegetarian free');
                        break;
                      case "Vegan free":
                        Provider.of<FilterManagement>(context, listen: false)
                            .toggleFilter('Vegan free');
                        break;
                      default:
                        break;
                    }
                  },
                ),
            ],
          ),
        );
      });
    });
  }
}
