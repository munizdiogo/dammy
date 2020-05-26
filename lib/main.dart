import 'package:dammy/screens/categories_meals_screen.dart';
import 'package:dammy/screens/category_screen.dart';
import 'package:dammy/screens/meal_detail_screen.dart';
import 'package:dammy/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => CategoryScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
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
