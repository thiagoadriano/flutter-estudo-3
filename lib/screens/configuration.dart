import 'package:flutter/material.dart';
import 'package:refeicoes/components/menu_app.dart';
import 'package:refeicoes/models/settings.dart';

class ConfigurationScreen extends StatefulWidget {
  final Settings settings;
  final void Function(Settings) onFilterCallback;

  const ConfigurationScreen(this.settings, this.onFilterCallback);

  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  Settings settings;
  
  SwitchListTile _createSwitch(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MenuApp(),
      body: ListView(
        children: [
          _createSwitch(
              'Sem Gluten', 'so refeicoes sem gluten', settings.isGlutenFree,
              (value) {
            settings.isGlutenFree = value;
            widget.onFilterCallback(settings);
          }),
          _createSwitch(
              'Sem Lactose', 'so refeicoes sem lactose', settings.isLactoseFree,
              (value) {
            settings.isLactoseFree = value;
            widget.onFilterCallback(settings);
          }),
          _createSwitch('Vagano', 'so refeicoes veganas', settings.isVegan,
              (value) {
            settings.isVegan = value;
            widget.onFilterCallback(settings);
          }),
          _createSwitch(
              'Vegetariano', 'so refeicoes vegetarianas', settings.isVegetarian,
              (value) {
            settings.isVegetarian = value;
            widget.onFilterCallback(settings);
          }),
        ],
      ),
    );
  }
}
