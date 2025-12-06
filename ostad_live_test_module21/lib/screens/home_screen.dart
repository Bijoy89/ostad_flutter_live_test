import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    final String jsonString = await rootBundle.loadString('assets/recipes.json');
    final data = json.decode(jsonString);

    setState(() {
      recipes = (data["recipes"] as List)
          .map((item) => Recipe.fromJson(item))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Recipes"),
        backgroundColor: Colors.blue,
      ),
      body: recipes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.fastfood,
            ),
            horizontalTitleGap: 30,
            title: Text(
              recipes[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              recipes[index].description,
              style: const TextStyle(fontSize: 14),
            ),
          );
        },
      ),
    );
  }
}
