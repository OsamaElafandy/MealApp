import 'package:flutter/material.dart';
import 'package:mealapp/catrgories_Meal_page/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id, title;
  final Color color;

  CategoryItem({@required this.id, @required this.title, @required this.color});

  _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.4), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            color: color,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
