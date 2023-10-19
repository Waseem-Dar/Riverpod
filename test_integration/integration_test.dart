import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("test integration", () {
     late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(()  {
      driver.close();
    });

    var textField = find.byType("TextFormField");
    var button = find.text("Reverse");
    var reverse = find.text("olleh");

    test("reverse test integration", () async {
      await driver.tap(textField);
      await driver.enterText("hello");
      await Future.delayed(const Duration(seconds: 3));
      await driver.waitForAbsent(reverse);
      await Future.delayed(const Duration(seconds: 3));
      await driver.tap(button);
      await driver.waitFor(reverse);
      await Future.delayed( const Duration(seconds: 3));
      await driver.waitUntilNoTransientCallbacks();
    });
  });
}