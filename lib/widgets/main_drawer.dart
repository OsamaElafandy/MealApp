import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';

import '../Filters_page/filters_screen.dart';
import '../tab_page/tabs_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(
      String title, IconData icon, Function tapHandler, BuildContext ctx) {
    return ListTile(
      leading: Icon(icon, size: 26, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
        elevation: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment:
                    lan.isEn ? Alignment.centerLeft : Alignment.centerRight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.black,
                      Colors.black54,
                      Colors.black,
                      Colors.black87,
                    ],
                  ),
                ),
                child: Text(
                  lan.getTexts('drawer_name'),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildListTile(lan.getTexts('drawer_item1'), Icons.restaurant, () {
                Navigator.of(context)
                    .pushReplacementNamed(TabsScreen.routeName);
              }, context),
              buildListTile(lan.getTexts('drawer_item2'), Icons.settings, () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              }, context),
              Divider(
                height: 10,
                color: Colors.black87,
              ),
              SizedBox(height: 10),
              Text(
                lan.getTexts('drawer_switch_title'),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(lan.getTexts('drawer_switch_item2'),
                      style: Theme.of(context).textTheme.headline6),
                  Switch(
                    value: lan.isEn,
                    onChanged: (newValue) {
                      lan.changeLan(newValue);
                      Navigator.of(context).pop();
                    },
                    inactiveTrackColor: Colors.black,
                  ),
                  Text(lan.getTexts('drawer_switch_item1'),
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                height: 10,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
