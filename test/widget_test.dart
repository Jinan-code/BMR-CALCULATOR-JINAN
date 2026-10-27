import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_7/main.dart';

void main() {
  testWidgets('BMR input screen opens the calculated result', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(412, 850);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    expect(tester.takeException(), isNull);
    expect(find.text('BMR CALCULATOR'), findsOneWidget);
    expect(find.text('AGE (years)'), findsOneWidget);

    await tester.tap(find.text('CALCULATE'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    // Default inputs are male, 60 kg, 160 cm, and 25 years: 1480 kcal/day.
    expect(find.text('1480'), findsOneWidget);
    expect(find.text('Calories/day at rest'), findsOneWidget);
  });
}
