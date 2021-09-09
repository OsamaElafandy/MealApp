import 'package:flutter/material.dart';
import 'package:mealapp/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../catrgories_Meal_page/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoraiteMeal = Provider.of<MealPro>(context).favoriteMeals;
    if (favoraiteMeal.isEmpty) {
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.star,
              color: Colors.white,
              size: 80,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "No Favorite Yet!",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          )
        ],
      ));
    }

    return ListView.builder(
        itemCount: favoraiteMeal.length,
        itemBuilder: (context, index) => MealItem(
              imageUrl: favoraiteMeal[index].imageUrl,
              title: favoraiteMeal[index].title,
              duration: favoraiteMeal[index].duration,
              complexity: favoraiteMeal[index].complexity,
              affordability: favoraiteMeal[index].affordability,
              id: favoraiteMeal[index].id,
            ));
  }
}
