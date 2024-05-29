import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/blankLinkScreen.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffF3F3F3),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(19, 39, 19, 5),
            child: Text(
              "Coffee Recipes",
              textAlign: TextAlign.center,
              key: Key(
                "coffee-recipes", //key value
              ),
              style: TextStyle(
                color: Color(0xff4c748B),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          RecipeList(),
          Padding(
            padding: EdgeInsets.fromLTRB(19, 39, 19, 5),
            child: Text(
              "Resources",
              textAlign: TextAlign.center,
              key: Key(
                "resource",
              ),
              style: TextStyle(
                color: Color(0xff4c748B),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ResourceList(),
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(19, 0, 19, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffff4c748B),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (CoffeeRecipe recipe in recipes)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                    Text(
                      recipe.name,
                      style: TextStyle(
                          fontFamily: "Kollektif",
                          fontSize: 14,
                          color: Color(0xff4c748b)),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    IconButton(
                      key: Key('btn-${recipe.name}'), //key value
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeDetailScreen(recipe)),
                        );
                      },
                      icon: Icon(Icons.chevron_right),
                      color: Color(0xff4c748b),
                    )
                  ],
                ),
                if (recipe != recipes[recipes.length - 1])
                  Divider(
                    color: Color(0xffff4c748B),
                    thickness: 1.0,
                  ),
              ],
            )
        ],
      ),
    );
  }
}

class ResourceList extends StatelessWidget {
  String url1 = "https://www.amazon.com/coffee/s?k=coffee";
  String url2 =
      "https://www.walmart.com/browse/home/coffee-grinders/4044_90548_90546_2971264_5885331";
  String url3 =
      "https://www.wayfair.com/kitchen-tabletop/sb1/tea-kettles-on-sale-c1763417-a69745~8.html";
  String url4 = "https://www.hazelnhershey.com/collections/filter-pourover";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(19, 0, 19, 0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffff4c748B),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            key: Key("coffee-rs"),
            title: Text(
              "Coffee",
              style: TextStyle(
                  color: Color(0xff4c748B),
                  fontFamily: "Kollektif",
                  fontSize: 14),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinkScreen(url1)),
              );
            },
          ),
          Divider(
            color: Color(0xffff4c748B),
            thickness: 1.0,
          ),
          ListTile(
            key: Key("grinders-rs"),
            title: Text("Grinders",
                style: TextStyle(
                    color: Color(0xff4c748B),
                    fontFamily: "Kollektif",
                    fontSize: 14)),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinkScreen(url2)),
              );
            },
          ),
          Divider(
            color: Color(0xffff4c748B),
            thickness: 1.0,
          ),
          ListTile(
            key: Key("kettles-rs"),
            title: Text("Kettles",
                style: TextStyle(
                    color: Color(0xff4c748B),
                    fontFamily: "Kollektif",
                    fontSize: 14)),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinkScreen(url3)),
              );
            },
          ),
          Divider(
            color: Color(0xffff4c748B),
            thickness: 1.0,
          ),
          ListTile(
            key: Key("HD-rs"),
            title: Text("Homebrew Dripper",
                style: TextStyle(
                    color: Color(0xff4c748B),
                    fontFamily: "Kollektif",
                    fontSize: 14)),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinkScreen(url4)),
              );
            },
          ),
        ],
      ),
    );
  }
}
