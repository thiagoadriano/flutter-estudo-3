import 'package:flutter/material.dart';
import 'package:refeicoes/components/category_item.dart';
import 'package:refeicoes/data/dummy_categories_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: DUMMY_CATEGORIES.map((category) => CategoryItem(category)).toList(),
    );
  }
}