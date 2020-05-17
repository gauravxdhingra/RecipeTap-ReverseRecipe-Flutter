import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:recipetap/pages/categories_recipe_screen.dart';

class AllCategoriesScroll extends StatelessWidget {
  const AllCategoriesScroll({
    Key key,
    @required this.categoriesMap,
  }) : super(key: key);

  final Map<String, Map<String, Map<String, String>>> categoriesMap;
  mealsFromCategory(categoryUrl, context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryRecipesScreen(url: categoryUrl)));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverStickyHeaderBuilder(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: state.isPinned
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                  : BorderRadius.all(
                      Radius.circular(40),
                    ),
              image: DecorationImage(
                image: NetworkImage(
                  categoriesMap[categoriesMap.keys.toList()[0]]["imageUrl"]
                      ["imageUrl"],
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 120.0,
            // color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            //     .withOpacity(1.0 - state.scrollPercentage),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              categoriesMap.keys.toList()[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
                  // leading: CircleAvatar(
                  //   child: Text(i.toString()),
                  // ),
                  title: Text(categoriesMap[categoriesMap.keys.toList()[0]]
                              ["categories"]
                          .keys
                          .toList()[i]
                      // .toList()[i],
                      ),
                  onTap: () {
                    mealsFromCategory(
                      categoriesMap[categoriesMap.keys.toList()[0]]
                              ["categories"][
                          categoriesMap[categoriesMap.keys.toList()[0]]
                                  ["categories"]
                              .keys
                              .toList()[i]],
                      context,
                      // .keys
                      // .toList()[i],
                    );
                  }
                  // Text('List tile #$i'),
                  ),
              childCount: categoriesMap[categoriesMap.keys.toList()[0]]
                      ["categories"]
                  .keys
                  .toList()
                  .length,
            ),
          ),
        ),
        SliverStickyHeaderBuilder(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: state.isPinned
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      //  *state.scrollPercentage
                    )
                  : BorderRadius.all(
                      Radius.circular(40),
                    ),
              // border: Border.all(
              //     width: 3,
              //     color: Colors.green,
              //     style: BorderStyle.solid),
              image: DecorationImage(
                image: NetworkImage(
                  categoriesMap[categoriesMap.keys.toList()[2]]["imageUrl"]
                      ["imageUrl"],
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 120.0,
            // color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            //     .withOpacity(1.0 - state.scrollPercentage),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              categoriesMap.keys.toList()[2],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
                  // leading: CircleAvatar(
                  //   child: Text(i.toString()),
                  // ),
                  title: Text(categoriesMap[categoriesMap.keys.toList()[2]]
                              ["categories"]
                          .keys
                          .toList()[i]
                      // .toList()[i],
                      ),
                  // Text('List tile #$i'),
                  onTap: () {
                    mealsFromCategory(
                      categoriesMap[categoriesMap.keys.toList()[2]]
                              ["categories"][
                          categoriesMap[categoriesMap.keys.toList()[2]]
                                  ["categories"]
                              .keys
                              .toList()[i]],
                      context,
                      // .keys
                      // .toList()[i],
                    );
                  }),
              childCount: categoriesMap[categoriesMap.keys.toList()[2]]
                      ["categories"]
                  .keys
                  .toList()
                  .length,
            ),
          ),
        ),
        SliverStickyHeaderBuilder(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: state.isPinned
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      //  *state.scrollPercentage
                    )
                  : BorderRadius.all(
                      Radius.circular(40),
                    ),
              // border: Border.all(
              //     width: 3,
              //     color: Colors.green,
              //     style: BorderStyle.solid),
              image: DecorationImage(
                image: NetworkImage(
                  categoriesMap[categoriesMap.keys.toList()[3]]["imageUrl"]
                      ["imageUrl"],
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 120.0,
            // color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            //     .withOpacity(1.0 - state.scrollPercentage),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              categoriesMap.keys.toList()[3],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
                  // leading: CircleAvatar(
                  //   child: Text(i.toString()),
                  // ),
                  title: Text(categoriesMap[categoriesMap.keys.toList()[3]]
                              ["categories"]
                          .keys
                          .toList()[i]
                      // .toList()[i],
                      ),
                  onTap: () {
                    mealsFromCategory(
                      categoriesMap[categoriesMap.keys.toList()[3]]
                              ["categories"][
                          categoriesMap[categoriesMap.keys.toList()[3]]
                                  ["categories"]
                              .keys
                              .toList()[i]],
                      context,
                      // .keys
                      // .toList()[i],
                    );
                  }
                  // Text('List tile #$i'),
                  ),
              childCount: categoriesMap[categoriesMap.keys.toList()[3]]
                      ["categories"]
                  .keys
                  .toList()
                  .length,
            ),
          ),
        ),
        SliverStickyHeaderBuilder(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: state.isPinned
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      //  *state.scrollPercentage
                    )
                  : BorderRadius.all(
                      Radius.circular(40),
                    ),
              // border: Border.all(
              //     width: 3,
              //     color: Colors.green,
              //     style: BorderStyle.solid),
              image: DecorationImage(
                image: NetworkImage(
                  categoriesMap[categoriesMap.keys.toList()[4]]["imageUrl"]
                      ["imageUrl"],
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 120.0,
            // color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            //     .withOpacity(1.0 - state.scrollPercentage),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              categoriesMap.keys.toList()[4],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
                  // leading: CircleAvatar(
                  //   child: Text(i.toString()),
                  // ),
                  title: Text(categoriesMap[categoriesMap.keys.toList()[4]]
                              ["categories"]
                          .keys
                          .toList()[i]
                      // .toList()[i],
                      ),
                  onTap: () {
                    mealsFromCategory(
                      categoriesMap[categoriesMap.keys.toList()[4]]
                              ["categories"][
                          categoriesMap[categoriesMap.keys.toList()[4]]
                                  ["categories"]
                              .keys
                              .toList()[i]],
                      context,
                      // .keys
                      // .toList()[i],
                    );
                  }
                  // Text('List tile #$i'),
                  ),
              childCount: categoriesMap[categoriesMap.keys.toList()[4]]
                      ["categories"]
                  .keys
                  .toList()
                  .length,
            ),
          ),
        ),
        SliverStickyHeaderBuilder(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: state.isPinned
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      //  *state.scrollPercentage
                    )
                  : BorderRadius.all(
                      Radius.circular(40),
                    ),
              // border: Border.all(
              //     width: 3,
              //     color: Colors.green,
              //     style: BorderStyle.solid),
              image: DecorationImage(
                image: NetworkImage(
                  categoriesMap[categoriesMap.keys.toList()[5]]["imageUrl"]
                      ["imageUrl"],
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 120.0,
            // color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            //     .withOpacity(1.0 - state.scrollPercentage),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              categoriesMap.keys.toList()[5],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
                  // leading: CircleAvatar(
                  //   child: Text(i.toString()),
                  // ),
                  title: Text(categoriesMap[categoriesMap.keys.toList()[5]]
                              ["categories"]
                          .keys
                          .toList()[i]
                      // .toList()[i],
                      ),
                  onTap: () {
                    mealsFromCategory(
                      categoriesMap[categoriesMap.keys.toList()[5]]
                              ["categories"][
                          categoriesMap[categoriesMap.keys.toList()[5]]
                                  ["categories"]
                              .keys
                              .toList()[i]],
                      context,
                      // .keys
                      // .toList()[i],
                    );
                  }
                  // Text('List tile #$i'),
                  ),
              childCount: categoriesMap[categoriesMap.keys.toList()[5]]
                      ["categories"]
                  .keys
                  .toList()
                  .length,
            ),
          ),
        ),
        SliverStickyHeaderBuilder(
          builder: (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: state.isPinned
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      //  *state.scrollPercentage
                    )
                  : BorderRadius.all(
                      Radius.circular(40),
                    ),
              // border: Border.all(
              //     width: 3,
              //     color: Colors.green,
              //     style: BorderStyle.solid),
              image: DecorationImage(
                image: NetworkImage(
                  categoriesMap[categoriesMap.keys.toList()[6]]["imageUrl"]
                      ["imageUrl"],
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 120.0,
            // color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            //     .withOpacity(1.0 - state.scrollPercentage),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              categoriesMap.keys.toList()[6],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => ListTile(
                  // leading: CircleAvatar(
                  //   child: Text(i.toString()),
                  // ),
                  title: Text(categoriesMap[categoriesMap.keys.toList()[6]]
                              ["categories"]
                          .keys
                          .toList()[i]
                      // .toList()[i],
                      ),
                  onTap: () {
                    mealsFromCategory(
                      categoriesMap[categoriesMap.keys.toList()[6]]
                              ["categories"][
                          categoriesMap[categoriesMap.keys.toList()[6]]
                                  ["categories"]
                              .keys
                              .toList()[i]],
                      context,
                      // .keys
                      // .toList()[i],
                    );
                  }
                  // Text('List tile #$i'),
                  ),
              childCount: categoriesMap[categoriesMap.keys.toList()[6]]
                      ["categories"]
                  .keys
                  .toList()
                  .length,
            ),
          ),
        ),
      ],
    );
  }
}