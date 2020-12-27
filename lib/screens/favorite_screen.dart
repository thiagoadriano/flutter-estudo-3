import 'package:flutter/material.dart';
import 'package:refeicoes/components/meal_item.dart';
import 'package:refeicoes/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhum favorito escolhido'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) => MealItem(favoriteMeals[index]),
      );
    }
  }
}
