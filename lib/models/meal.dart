import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id, title, imageUrl;
  final List<String> categories, ingredients, steps;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const Meal(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.categories,
      @required this.ingredients,
      @required this.steps,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});
}
