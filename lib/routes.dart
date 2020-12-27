import 'package:flutter/material.dart';
import 'package:refeicoes/models/meal.dart';
import 'package:refeicoes/models/settings.dart';
import 'package:refeicoes/screens/categories_meals_screen.dart';
import 'package:refeicoes/screens/configuration.dart';
import 'package:refeicoes/screens/meal_detail_screen.dart';
import 'package:refeicoes/screens/tabs_screen.dart';

class Routes {
  static const HOME = '/';
  static const CATEGORIES_MEALS = '/categories-meals';
  static const MEAL_DETAIL = '/meal-detail';
  static const CONFIGURATION = '/configuration';

  static noRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => TabsScreen([]));
  }

  static configuration(
    List<Meal> filterdMeals,
    Settings settings,
    List<Meal> favoriteMeals,
    void Function(Settings) onChangedSettings,
    void Function(Meal) toogleFavorite,
    bool Function(Meal) checkIsFavoriteMeal,
  ) {
    return {
      HOME: (ctx) => TabsScreen(favoriteMeals),
      CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(filterdMeals),
      MEAL_DETAIL: (ctx) => MealDetailScreen(toogleFavorite, checkIsFavoriteMeal),
      CONFIGURATION: (ctx) => ConfigurationScreen(settings, onChangedSettings),
    };
  }
}
