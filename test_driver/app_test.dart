// Imports the Flutter Driver API.
import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Homebrew Dripper App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at homescreen', () async {
      //user lands on coffee recipes screen
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });

    /*
      Given you are on the Coffee Recipes/Resources
      When I tap on "Sweet Maria's"
      And I tap on start
      Timer begins countdown to 0 
      Continues to next step etc.
      Then Enjoy your amazing coffee
      Tap on done and return to the Coffee Recipes/Resources
    */
    test('Happy Path for Coffee Recipe Sweet Maria', () async {
      final coffeeRecipeFinder = find.byValueKey("btn-Sweet Maria's");
      final startButtonFinder = find.byValueKey('start-btn');
      final doneText = find.byValueKey('done-txt');
      final doneButtonFinder = find.byValueKey('btn-done');
      await driver.tap(coffeeRecipeFinder);
      await driver.tap(startButtonFinder);
      expect(await driver.getText(doneText), "Done");
      await driver.tap(doneButtonFinder);
    }, timeout: Timeout.factor(8));
    test('Happy Path for Coffee Recipe PT', () async {
      final coffeeRecipeFinder = find.byValueKey("btn-PT");
      final startButtonFinder = find.byValueKey('start-btn');
      final doneText = find.byValueKey('done-txt');
      final doneButtonFinder = find.byValueKey('btn-done');
      await driver.tap(coffeeRecipeFinder);
      await driver.tap(startButtonFinder);
      expect(await driver.getText(doneText), "Done");
      await driver.tap(doneButtonFinder);
    }, timeout: Timeout.factor(8));
    test('Happy Path for Coffee Recipe Texas Coffee School', () async {
      final coffeeRecipeFinder = find.byValueKey("btn-Texas Coffee School");
      final startButtonFinder = find.byValueKey('start-btn');
      final doneText = find.byValueKey('done-txt');
      final doneButtonFinder = find.byValueKey('btn-done');
      await driver.tap(coffeeRecipeFinder);
      await driver.tap(startButtonFinder);
      expect(await driver.getText(doneText), "Done");
      await driver.tap(doneButtonFinder);
    }, timeout: Timeout.factor(8));
    test('Happy Path for Coffee Recipe Homegrounds', () async {
      final coffeeRecipeFinder = find.byValueKey("btn-Homegrounds");
      final startButtonFinder = find.byValueKey('start-btn');
      final doneText = find.byValueKey('done-txt');
      final doneButtonFinder = find.byValueKey('btn-done');
      await driver.tap(coffeeRecipeFinder);
      await driver.tap(startButtonFinder);
      expect(await driver.getText(doneText), "Done");
      await driver.tap(doneButtonFinder);
    }, timeout: Timeout.factor(8));
    group("Resources", () {
      test("Click on Coffee resources", () async {
        final coffeeRs = find.byValueKey("coffee-rs");
        final linkKey = find.byValueKey("link-key");
        final backKey = find.byValueKey("Back-key");
        await driver.tap(coffeeRs);
        expect(await driver.getText(linkKey),
            "https://www.amazon.com/coffee/s?k=coffee");
        await driver.tap(backKey);
      });
      test("Click on Grinders resources", () async {
        final grindersRs = find.byValueKey("grinders-rs");
        final linkKey = find.byValueKey("link-key");
        final backKey = find.byValueKey("Back-key");
        await driver.tap(grindersRs);
        expect(await driver.getText(linkKey),
            "https://www.walmart.com/browse/home/coffee-grinders/4044_90548_90546_2971264_5885331");
        await driver.tap(backKey);
      });
      test("Click on Kettles resources", () async {
        final kettlesRs = find.byValueKey("kettles-rs");
        final linkKey = find.byValueKey("link-key");
        final backKey = find.byValueKey("Back-key");
        await driver.tap(kettlesRs);
        expect(await driver.getText(linkKey),
            "https://www.wayfair.com/kitchen-tabletop/sb1/tea-kettles-on-sale-c1763417-a69745~8.html");
        await driver.tap(backKey);
      });
      test("Click on Homebrew Dripper resources", () async {
        final hdRs = find.byValueKey("HD-rs");
        final linkKey = find.byValueKey("link-key");
        final backKey = find.byValueKey("Back-key");
        await driver.tap(hdRs);
        expect(await driver.getText(linkKey),
            "https://www.hazelnhershey.com/collections/filter-pourover");
        await driver.tap(backKey);
      });
    });
  });
}


 // Use the `driver.getText` method to verify the counter starts at 0.