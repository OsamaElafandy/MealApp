import 'package:flutter/material.dart';
import 'package:mealapp/models/dummy_data.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';

import '../providers/meal_provider.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = 'meal_detail';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }

  Widget buildContainer(Widget child) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;
    var dh = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      height: isLandscape ? dh * 0.5 : dh * 0.25,
      width: isLandscape ? (dw * 0.5 - 30) : dw,
      child: child,
    );
  }

  String mealId;

  @override
  void didChangeDependencies() {
    mealId = ModalRoute.of(context).settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    var lan = Provider.of<LanguageProvider>(context, listen: true);

    List<String> stepsLi = lan.getTexts('steps-$mealId') as List<String>;
    var liSteps = ListView.builder(
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text("# ${index + 1}"),
            ),
            title: Text(
              stepsLi[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
          Divider(),
        ],
      ),
      itemCount: stepsLi.length,
    );
    List<String> liIngredientLi =
        lan.getTexts('ingredients-$mealId') as List<String>;
    var liIngredients = ListView.builder(
      itemBuilder: (ctx, index) => Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            liIngredientLi[index],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      itemCount: liIngredientLi.length,
    );

    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black,
                    Colors.black54,
                    Colors.black54,
                    Colors.black87,
                  ],
                ),
              ),
            ),
            title: Text(lan.getTexts('meal-$mealId'))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Hero(
                    tag: mealId,
                    child: Image.network(selectedMeal.imageUrl,
                        fit: BoxFit.cover)),
              ),
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        buildSectionTitle(context, lan.getTexts('Ingredients')),
                        buildContainer(liIngredients),
                      ],
                    ),
                    Column(
                      children: [
                        buildSectionTitle(context, lan.getTexts('Steps')),
                        buildContainer(liSteps),
                      ],
                    ),
                  ],
                ),
              if (!isLandscape)
                buildSectionTitle(context, lan.getTexts('Ingredients')),
              if (!isLandscape) buildContainer(liIngredients),
              if (!isLandscape)
                buildSectionTitle(context, lan.getTexts('Steps')),
              if (!isLandscape) buildContainer(liSteps),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () => Provider.of<MealPro>(context, listen: false)
              .toggleFavorite(mealId),
          child: Icon(
            Provider.of<MealPro>(context, listen: true).isFavorite(mealId)
                ? Icons.star
                : Icons.star_border,
          ),
        ),
      ),
    );
  }
}