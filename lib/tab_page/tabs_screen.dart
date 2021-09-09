import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../categories_Page/categories_screen.dart';
import '../favoraites_page/favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../providers/meal_provider.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = 'tabs_screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    Provider.of<MealPro>(context, listen: false).getData();
    Provider.of<LanguageProvider>(context, listen: false).getLan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lan = Provider.of<LanguageProvider>(context, listen: true);
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': lan.getTexts('categories'),
      },
      {
        'page': FavoritesScreen(),
        'title': lan.getTexts('your_favorites'),
      },
    ];

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
            title: Text(_pages[_selectedPageIndex]['title'])),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [Icons.category, Icons.star],
          activeIndex: _selectedPageIndex,
          activeColor: Colors.amber,
          height: 65,
          notchMargin: 10,
          elevation: 1,
          inactiveColor: Colors.white,
          iconSize: 35,
          gapLocation: GapLocation.center,

          backgroundColor: Colors.black87,
          onTap: (index) => setState(() => _selectedPageIndex = index),
          //other params
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
