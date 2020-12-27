import 'package:flutter/material.dart';
import 'package:refeicoes/routes.dart';

class MenuApp extends StatelessWidget {
  Container _title(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Theme.of(context).accentColor,
      alignment: Alignment.bottomCenter,
      child: Text(
        'Vamos Cozinhar?',
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }

  ListTile _link(
      BuildContext context, IconData icon, String label, String page) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontFamily: 'RobotoCondensed'),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(page);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _title(context),
          SizedBox(height: 20,),
          _link(context, Icons.restaurant, 'Refeições', Routes.HOME),
          _link(context, Icons.settings, 'Configurações', Routes.CONFIGURATION),
        ],
      ),
    );
  }
}
