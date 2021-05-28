import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  final height;
  final weight;

  double _bmi = 3.4;

  String getBMI() => _bmi.toStringAsFixed(1);

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Interpretation Overweight';
    } else if (_bmi > 18.5) {
      return 'Interpretation Normal';
    } else {
      return 'Interpretation Underweight';
    }
  }
}
