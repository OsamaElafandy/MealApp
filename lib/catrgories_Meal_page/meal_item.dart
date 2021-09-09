import 'package:flutter/material.dart';
import '../meal_detail_page/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title, imageUrl, id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.title,
      @required this.id,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;

      case Complexity.Challenging:
        return "Challenging";
        break;

      case Complexity.Hard:
        return "Hard";
        break;

      default:
        return "UnKown";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;

      case Affordability.Pricey:
        return "Pricey";
        break;

      case Affordability.Luxurious:
        return "Luxurious";
        break;

      default:
        return "UnKown";
        break;
    }
  }

  _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _selectMeal(context),
        child: SizedBox(
          height: 500,
          child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Hero(
                          tag: id,
                          child: Image.network(
                            imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        color: Colors.black54,
                        child: Text(title,
                            style: TextStyle(fontSize: 26, color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade),
                      ),
                    ),
                  ]),
                  Container(
                    height: 200,
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule),
                            SizedBox(width: 6),
                            Text(
                              "$duration min",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work),
                            SizedBox(width: 6),
                            Text(
                              "$complexityText",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.attach_money),
                            SizedBox(width: 6),
                            Text(
                              "$affordabilityText",
                              style: TextStyle(fontSize: 5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
