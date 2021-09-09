import 'package:flutter/material.dart';
import 'package:mealapp/Filters_page/Filters_Screen.dart';

class MainDrawer extends StatelessWidget {
  ListTile buildListTile(IconData icon, String title, Function function) {
    return ListTile(
      onTap: function,
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: Text("Cooking Up!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ))),
          SizedBox(height: 20),
          buildListTile(Icons.restaurant, "Meal", () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          SizedBox(height: 10),
          buildListTile(Icons.settings, "Filters", () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
