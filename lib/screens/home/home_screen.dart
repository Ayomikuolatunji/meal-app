import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 232, 230, 230),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 24,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Text(
              "Transactions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const Text(
            "February 2018",
            style: TextStyle(color: Colors.purple),
          ),
          const Text("3128"),
        ],
      ),
    );
  }
}
