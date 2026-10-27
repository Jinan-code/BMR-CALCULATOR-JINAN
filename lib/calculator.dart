// calculator.dart
import 'constants.dart';

class Calculator {
  Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  final int height;
  final int weight;
  final int age;
  final Gender gender;

  // Menghitung estimasi kalori saat istirahat dengan rumus Mifflin-St Jeor.
  double calculateBMR() {
    // Jenis kelamin menentukan konstanta penyesuaian dalam rumus.
    final sexAdjustment = gender == Gender.male ? 5 : -161;
    return 10 * weight + 6.25 * height - 5 * age + sexAdjustment;
  }
}
