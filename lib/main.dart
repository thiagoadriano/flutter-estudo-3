import 'package:flutter/material.dart';
import 'package:refeicoes/data/dummy_meals_data.dart';
import 'package:refeicoes/models/meal.dart';
import 'package:refeicoes/models/settings.dart';
import 'package:refeicoes/routes.dart';

void main() => runApp(MyApp());

ThemeData themeConfig = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    fontFamily: 'Raleway',
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    textTheme: ThemeData.light().textTheme.copyWith(
        headline3: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            color: Colors.white,
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 18,
            fontFamily: 'RobotoCondensed',
            color: Colors.grey[900],
            fontWeight: FontWeight.bold)));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _mealsList = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _onChangedSettings(Settings settings) {
    setState(() {
      this.settings = settings;
      _mealsList = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toogleFavorite(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _checkMealFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: themeConfig,
      routes: Routes.configuration(
        _mealsList,
        settings,
        _favoriteMeals,
        _onChangedSettings,
        _toogleFavorite,
        _checkMealFavorite
      ),
      onUnknownRoute: (RouteSettings settings) => Routes.noRoute(settings),
    );
  }
}
