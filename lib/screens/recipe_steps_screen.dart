import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: Color(0xFF4C748B),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(32)),
              Text("$stepTimeRemaining",
                  key: Key('time-rem'),
                  style: TextStyle(
                      fontFamily: "Kollektif",
                      fontSize: 96,
                      color: Colors.white,
                      letterSpacing: 1.5)),
              Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
              Text(
                "${currentRecipeStep.text}",
                style: TextStyle(
                    fontFamily: "Kollektif",
                    fontSize: 24,
                    color: Colors.white,
                    letterSpacing: 1.5),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
              Text("Steps",
                  style: TextStyle(
                      fontFamily: "Kollektif",
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: 1.5)),
              Padding(padding: EdgeInsets.fromLTRB(240, 0, 0, 0)),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          for (RecipeStep step in remainingSteps)
            Column(
              children: [
                Container(
                  height: 36.0,
                  width: 337.0,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF4C748B),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(
                              width: 2.0,
                              color: step == remainingSteps[0]
                                  ? Colors.white
                                  : Color(0xFF4C748B))),
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
                                    color: Colors.white),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                "${step.time ~/ 60}:${(step.time % 60).toString().length < 2 ? "0" + (step.time % 60).toString() : (step.time % 60).toString()}",
                                style: TextStyle(
                                    fontFamily: "Kollektif",
                                    fontSize: 12,
                                    letterSpacing: 1.5,
                                    color: Colors.white),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0))
                            ],
                          ),
                        ],
                      )),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 12.5, 0, 0))
              ],
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
