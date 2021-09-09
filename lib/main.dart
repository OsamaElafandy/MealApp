import 'package:flutter/material.dart';
import 'package:mealapp/Filters_page/Filters_Screen.dart';
import 'package:mealapp/catrgories_Meal_page/category_meals_screen.dart';
import 'package:mealapp/meal_detail_page/meal_detail_screen.dart';
import 'package:mealapp/tab_page/tabs_screen.dart';
import 'package:provider/provider.dart';
import './providers/language_provider.dart';
import './providers/meal_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealPro>(
          create: (ctx) => MealPro(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (ctx) => LanguageProvider(),
        ),
      ],
      child: MyApp(TabsScreen()),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget mainScreen;

  MyApp(this.mainScreen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
      ),
      routes: {
        '/': (ctx) => mainScreen,
        TabsScreen.routeName: (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
    );
  }
}
