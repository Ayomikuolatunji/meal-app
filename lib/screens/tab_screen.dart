import 'package:flutter/material.dart';
import 'package:net_ninja_course/screens/categories_screen.dart';
import 'package:net_ninja_course/screens/favorites_screen.dart';
import 'package:net_ninja_course/widgets/main_drawer.dart';
import "package:net_ninja_course/screens/filters_screen.dart";


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String activatePageTitle = "Categories";

  void onSelectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (index == 1) activatePageTitle = "Favorites";
      if (index == 0) activatePageTitle = "Categories";
    });
  }

  void _onSetScreen(Identifier identifier) {
    Navigator.pop(context);
    if (identifier == Identifier.filters) {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const FilterScreens()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activatePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _onSetScreen,
      ),
      body: _selectedPageIndex == 0
          ? const CategoriesScreen()
          : const FavoritesScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
        onTap: (index) {
          onSelectedPage(index);
        },
      ),
    );
  }
}
