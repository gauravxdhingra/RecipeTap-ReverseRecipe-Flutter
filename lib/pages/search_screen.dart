// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
// import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:recipetap/models/search_suggestions.dart';
import 'package:recipetap/pages/catagories_screen.dart';
import 'package:recipetap/pages/search_results.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);
  static const routeName = 'search_screen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController inclController = TextEditingController();
  TextEditingController exclController = TextEditingController();
  TextEditingController normalSearchController = TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  GlobalKey<AutoCompleteTextFieldState<String>> keyy = GlobalKey();

// TODO: all user search inputs lowercase
// TODO spaces replace %20
// TODO check same ingredient not included and excluded
// TODO: Handle empty search result page 404
// TODO: Review all 10,000 Suggestions

  @override
  void initState() {
    inclController = TextEditingController();
    exclController = TextEditingController();
    normalSearchController = TextEditingController();

    super.initState();
    // print(suggestions);
  }

  List<String> suggestions = SearchSuggestions.suggestions;
  @override
  void dispose() {
    inclController.dispose();
    exclController.dispose();
    normalSearchController.dispose();
    super.dispose();
  }

  submitSearch(incl, excl) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchResultsScreen(
            url:
                'https://www.allrecipes.com/search/results/?ingIncl=$incl&ingExcl=$excl&sort=re')));
    print(
        'https://www.allrecipes.com/search/results/?ingIncl=$incl&ingExcl=$excl&sort=re');
  }

  submitSearchNormal(String appbarTitle, String url) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchResultsScreen(
            appBarTitle: appbarTitle,
            url: 'https://www.allrecipes.com/search/results/?wt=$url&sort=re'
            // url: url,
            )));
    print(url);
  }

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Likes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO Custom Name Appbar
      appBar: AppBar(),

      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),

      body: Container(
        child: Column(
          children: <Widget>[
            Text('Search'),
            TextFormField(
              controller: normalSearchController,
            ),
            FlatButton(
              child: Text('Search Recipe by name'),
              onPressed: () => submitSearchNormal(
                "Showing Results For " + normalSearchController.text,
                normalSearchController.text
                    .replaceAll(" ", "%20")
                    .toLowerCase(),
              ),
            ),
            // TODO retry button for dns fail
            Text('Favourites'),
            Text('Browse By Category'),
            FlatButton(
              child: Text('CategoriesScreen'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoriesScreen()));
              },
            ),
            Text('Search By Ingredients'),
            SizedBox(
              height: 50,
            ),
            Text('Include'),
            SimpleAutoCompleteTextField(
              key: key,
              suggestions: suggestions,
              // textChanged: (query) => suggestions.add(query),
              controller: inclController,
            ),
            SizedBox(
              height: 50,
            ),
            Text('Exclude'),
            SimpleAutoCompleteTextField(
              key: keyy,
              suggestions: suggestions,
              controller: exclController,
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              child: Text('Search'),
              onPressed: () {
                submitSearch(
                  inclController.text.toLowerCase().replaceAll(" ", "%20"),
                  exclController.text.toLowerCase().replaceAll(" ", "%20"),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.supervised_user_circle,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
