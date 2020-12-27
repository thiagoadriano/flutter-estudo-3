import 'package:flutter/material.dart';
import 'package:refeicoes/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final void Function(Meal) onToogleFavorite;
  final bool Function(Meal) checkIsFavoriteMeal;

  const MealDetailScreen(this.onToogleFavorite, this.checkIsFavoriteMeal);

  Widget _builderIntemList(BuildContext context, String item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(item),
      ),
      color: Theme.of(context).accentColor,
    );
  }

  Widget _builderIntemNumericList(BuildContext context, String item, int number) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(child: Text(number.toString())),
        title: Text(item),
      ),
    );
  }

  Widget _section(BuildContext context, String title, List<String> list, bool isNumeric) {
    final widthBox = MediaQuery.of(context).size.width * 0.92;
    return Column(
      children: [
        Container(
          width: widthBox,
          padding: const EdgeInsets.symmetric(vertical: 4),
          margin: const EdgeInsets.only(top: 10, bottom: 2),
          decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            )),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
        Container(
          width: widthBox,
          height: 200,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) => !isNumeric
                ? _builderIntemList(context, list[index])
                : _builderIntemNumericList(context, list[index], index + 1),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _section(context, 'Ingredientes', meal.ingredients, false),
            _section(context, 'Passos', meal.steps, true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(checkIsFavoriteMeal(meal) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          onToogleFavorite(meal);
        },
      ),
    );
  }
}
