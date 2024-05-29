import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);
  int totStepTime(CoffeeRecipe rec) {
    int totalTime = 0;
    for (RecipeStep step in rec.steps) {
      totalTime = totalTime + step.time;
    }
    return totalTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeSelectionScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: Color(0xff4c748b),
                  ))
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
          Container(
            height: 164.0,
            width: 337.0,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Color(0xFF4C748B), width: 1.75),
              ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(6)),
                  Text(
                    recipe.name,
                    style: TextStyle(
                        fontFamily: 'Kollektif',
                        fontSize: 18,
                        letterSpacing: 1.5,
                        color: Color(0xFF4C748B)),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text('${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}',
                      key: Key('coffeeGramstext'), //key value
                      style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontSize: 14,
                          color: Color(0xFF4C748B))),
                  Text('${recipe.waterVolumeGrams}g - Water',
                      key: Key('waterGramstext'), //key value
                      style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontSize: 14,
                          color: Color(0xFF4C748B))),
                  Padding(padding: EdgeInsets.all(20)),
                  Text(
                    recipe.miscDetails,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF4C748B)),
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
              Text("Steps",
                  style: TextStyle(
                    fontFamily: "Kollektif",
                    fontSize: 14,
                  )),
              Padding(padding: EdgeInsets.fromLTRB(240, 0, 0, 0)),
              Text(
                "Total: ${totStepTime(recipe) ~/ 60}:${((totStepTime(recipe)) % 60).toString().length < 2 ? "0" + ((totStepTime(recipe)) % 60).toString() : ((totStepTime(recipe)) % 60).toString()}",
                textAlign: TextAlign.right,
                style: TextStyle(fontFamily: "Kollektif", fontSize: 12),
              )
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          for (RecipeStep step in recipe.steps)
            Column(
              children: [
                Container(
                  height: 36.0,
                  width: 337.0,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border:
                              Border.all(width: 2.0, color: Color(0xFF4C748B))),
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(10, 1, 0, 0),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3.5),
                          ),
                          Row(
                            children: [
                              Text(
                                step.text,
                                style: TextStyle(
                                    fontFamily: "Kollektif",
                                    fontSize: 12,
                                    letterSpacing: 1.5,
                                    color: Color(0xFF4C748B)),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "${step.time ~/ 60}:${(step.time % 60).toString().length < 2 ? "0" + (step.time % 60).toString() : (step.time % 60).toString()}",
                                key: Key("time-key"),
                                style: TextStyle(
                                    fontFamily: "Kollektif",
                                    fontSize: 12,
                                    letterSpacing: 1.5,
                                    color: Color(0xFF4C748B)),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0))
                            ],
                          ),
                        ],
                      )),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0))
              ],
            ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
          Container(
            height: 46.0,
            width: 280.0,
            color: Colors.transparent,
            child: Container(
              height: 46.0,
              width: 280.0,
              decoration: BoxDecoration(
                color: Color(0xFF4C748B),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(width: 2.0, color: Color(0xFF4C748B)),
              ),
              child: TextButton(
                key: Key('start-btn'),
                child: Text("Start",
                    style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.normal)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(recipe)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
