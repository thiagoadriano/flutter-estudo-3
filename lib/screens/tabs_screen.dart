import 'package:flutter/material.dart';
import 'package:refeicoes/components/menu_app.dart';
import 'package:refeicoes/models/meal.dart';

import 'package:refeicoes/screens/categories_screen.dart';
import 'package:refeicoes/screens/favorite_screen.dart';


class TabsScreen extends StatefulWidget {
  List<Meal> _favoriteMeals;

  TabsScreen(this._favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screenList;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _screenList = [
      {'title': 'Lista de Categorias', 'screen': CategoriesScreen()}, 
      {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget._favoriteMeals)}
    ];
  }

  BottomNavigationBarItem navigationItem(String title, IconData iconType) {
    return BottomNavigationBarItem(
      icon: Icon(iconType),
      label: title,
    );
  }

  void _setSelectTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _selected = _screenList[_selectedTab];
    return Scaffold(
      appBar: AppBar(
        title: Text(_selected['title']),
      ),
      drawer: MenuApp(),
      body: _selected['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setSelectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        fixedColor: Colors.pink[900],
        currentIndex: _selectedTab,
        items: [
          navigationItem('Categorias', Icons.category),
          navigationItem('Favoritos', Icons.favorite)
        ]
      ),
    );
  }
}