import 'package:dammy/data/dammy_data.dart';
import 'package:dammy/models/settings.dart';
import 'package:dammy/screens/categories_meals_screen.dart';
import 'package:dammy/screens/meal_detail_screen.dart';
import 'package:dammy/screens/settings_screen.dart';
import 'package:dammy/screens/tabs_screen.dart';
import 'package:dammy/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings){
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isGlutenFree && !meal.isLactoseFree;
        final filterVegan = settings.isGlutenFree && !meal.isVegan;
        final filterVegetarian = settings.isGlutenFree && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        brightness: Brightness.light,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals),
      },
      // METODO PARA DEFINIR UMA ROTA QUANDO TENTAR ACESSAR UMA ROTA INEXISTENTE.
      // EX.: PÁGINA DE 404. SCREEN NÃO ENCONTRADA
      // onGenerateRoute: (settings) {
      //   if(settings.name == '/alguma-coisa'){
      //     return null;
      //   } else if (settings == 'outra-coisa') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(builder: (_){
      //       return CategoryScreen();
      //     });
      //   }
      // },
      // METODO PARA DEFINIR UMA ROTA QUANDO UMA ROTA NÃO EXISTIR. SERÁ EXECUTADO APÓS O onGenerateRoute
      // // EX.: PÁGINA DE 404. SCREEN NÃO ENCONTRADA
      // onUnknownRoute: (settings){
      //   return MaterialPageRoute(
      //     builder: (_){
      //       return CategoryScreen();
      //     }
      //   );
      // },
    );
  }
}
