import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/Provider/value_notifier.dart';

import 'package:new_project/main.dart';

void main() {
 testWidgets("text-field testing", (WidgetTester tester) async{
   await tester.pumpWidget(const MyApp());
   var  textField = find.byType(TextFormField);
   expect(textField, findsOneWidget);
   await tester.enterText(textField, "hello");
   var button = find.byType(TextButton);
   await tester.tap(button);
   await tester.pump();
   expect(find.text("olleh"), findsOneWidget);
 });
}
