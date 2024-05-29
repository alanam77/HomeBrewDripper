import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class LinkScreen extends StatelessWidget {
  String _link;
  LinkScreen(this._link);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _link,
            style: TextStyle(fontSize: 24),
            key: Key("link-key"),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
          IconButton(
              key: Key("Back-key"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeSelectionScreen()),
                );
              },
              icon: Icon(
                Icons.chevron_left,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
