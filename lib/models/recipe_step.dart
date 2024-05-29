class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    if (text == '' || text == null) {
      throw ArgumentError();
    }
    if (time <= 0) {
      throw ArgumentError();
    }
    //for example, reject negative gram amounts
    this.text = text;
    this.time = time;
  }
}
