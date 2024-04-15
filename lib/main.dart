import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:net_ninja_course/providers/favorites_management.dart';
import 'package:net_ninja_course/providers/filter_management.dart';
import 'package:net_ninja_course/screens/tab_screen.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FavoriteMealsManagement>(
            create: (ctx) => FavoriteMealsManagement(),
          ),
          ChangeNotifierProvider<FilterManagement>(
              create: (ctx) => FilterManagement())
        ],
        child: MaterialApp(
          theme: theme,
          home: const TabsScreen(),
        ));
  }
}
