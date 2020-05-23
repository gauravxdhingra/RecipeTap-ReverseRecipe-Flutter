import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipetap/jump_screens/aww_snap_screen.dart';
import 'package:recipetap/pages/home_screen.dart';
import 'package:recipetap/pages/login_page.dart';
import 'package:recipetap/pages/search_screen.dart';
import './provider/auth_provider.dart';
import 'package:recipetap/utility/route_generator.dart';
import 'package:recipetap/widgets/loading_spinner.dart';

import 'pages/recipe_view_page.dart';

void main() {
  runApp(MyApp());
}

// TODO: Handle Text Overflows Everywhere in the app

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'RecipeTap',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // primaryColor: Colors.white,
        // primaryColor: Color(0xffEC008C),
        primaryColor: Color(0xffF01E91),
        accentColor: Colors.blueGrey[900],
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
          ),
          headline3: TextStyle(
            fontSize: 20,
          ),
          bodyText2: TextStyle(
            // fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(),

      routes: {
        '/':
            // (context) => LoginPage(),
            (context) => HomeScreen(),
        HomeScreen.routeName: (context) => ChangeNotifierProvider<AuthProvider>(
              child: HomeScreen(),
              create: (context) => AuthProvider(),
            ),
        SearchScreen.routeName: (context) => SearchScreen(),
        RecipeViewPage.routeName: (context) => RecipeViewPage(),
      },
      // onGenerateRoute: (settings) {
      //   return RouteGenerator.generateRoute(settings);
      // },
      onUnknownRoute: (_) => MaterialPageRoute(builder: (_) => AwwSnapScreen()),
    );
  }
// TODO: Firebase Login
// TODO: Favourites on Firebase
// TODO: Recent Recipes on Firebase
// TODO: Favourite categories on Firebse
// TODO: Favoutite Category Options on Firebase
}
