import 'dart:math';

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];
    var testRecipe = CoffeeRecipe("Test", 1, 1, "Test", "Test", steps);
    //check that it has the right data
    expect(testRecipe.name, "Test");
    expect(testRecipe.coffeeVolumeGrams, 1);
    expect(testRecipe.waterVolumeGrams, 1);
    expect(testRecipe.grindSize, "Test");
    expect(testRecipe.steps, steps);
  });
  test('creates an invalid coffee recipe with empty name', () {
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];
    expect(() => CoffeeRecipe("", 1, 1, "Test", "Test", steps),
        throwsArgumentError);
  });
  test(
      'creates an invalid coffee recipe with negative integer values for coffee grounds',
      () {
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];
    expect(() => CoffeeRecipe("Test", -1, 1, "Test", "Test", steps),
        throwsArgumentError);
  });
  test(
      'creates an invalid coffee recipe with negative integer values for water',
      () {
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];
    expect(() => CoffeeRecipe("Test", 1, -1, "Test", "Test", steps),
        throwsArgumentError);
  });
  test('creates an invalid coffee recipe with empty grindSize value', () {
    List<RecipeStep> steps = [
      RecipeStep("Add 360g water", 30),
      RecipeStep("Cover and wait", 90),
      RecipeStep("Stir", 15),
      RecipeStep("Cover and wait", 75),
      RecipeStep("Stir", 15),
    ];
    expect(() => CoffeeRecipe("Test", 1, -1, "", "Test", steps),
        throwsArgumentError);
  });
  //how do we test rejecting invalid coffee recipes?
}
