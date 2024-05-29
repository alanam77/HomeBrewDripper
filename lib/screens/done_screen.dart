import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 750,
              alignment: Alignment.center,
              child: Text(
                "enjoy your amazing\n handmade coffee",
                style: TextStyle(
                    color: Color(0xff4c748B),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                    letterSpacing: 1.5),
              ),
            ),
            TextButton(
              key: Key('btn-done'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeSelectionScreen()));
              },
              child: Text(
                "Done",
                key: Key("done-txt"),
                style: TextStyle(
                    color: Color(0xff4c748B),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                    letterSpacing: 1.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
