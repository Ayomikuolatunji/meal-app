import 'package:flutter/material.dart';
// import 'package:net_ninja_course/groceries.dart';
import 'package:net_ninja_course/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Groceries',
      // theme: ThemeData.dark().copyWith(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: const Color.fromARGB(255, 147, 229, 250),
      //     brightness: Brightness.dark,
      //     surface: const Color.fromARGB(255, 42, 51, 59),
      //   ),
      //   scaffoldBackgroundColor: Color.fromARGB(255, 238, 242, 244),
      // ),
      home: const HomeScreen(),
    );
  }
}
