import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_7/calculator.dart';
import 'package:flutter_application_7/constants.dart';

void main() {
  group('Mifflin-St Jeor BMR calculation', () {
    test('calculates the male equation', () {
      final calculator = Calculator(
        height: 180,
        weight: 75,
        age: 30,
        gender: Gender.male,
      );

      expect(calculator.calculateBMR(), 1730);
    });

    test('calculates the female equation', () {
      final calculator = Calculator(
        height: 180,
        weight: 75,
        age: 30,
        gender: Gender.female,
      );

      expect(calculator.calculateBMR(), 1564);
    });
  });
}
