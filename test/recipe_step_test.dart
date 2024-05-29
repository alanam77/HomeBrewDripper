import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step
    var TestStep = RecipeStep("Test", 1);
    expect(TestStep.text, "Test");
    expect(TestStep.time, 1);
    //check that it has the right data
  });
  test('creates a invalid recipe step with empty text description', () {
    expect(() => RecipeStep("", 1), throwsArgumentError);
  });
  test('creates a invalid recipe step with negative time', () {
    expect(() => RecipeStep("Test", -1), throwsArgumentError);
  });
  //how do we test rejecting invalid recipe steps?
}
