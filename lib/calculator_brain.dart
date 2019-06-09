import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    String result;

    if (_bmi >= 25) {
      result = 'Overweight';
    } else if (_bmi >= 18.5) {
      result = 'Normal';
    } else {
      result = 'Underweight';
    }

    return result;
  }

  String getInterpretation() {
    String interpretation;

    if (_bmi >= 25) {
      interpretation =
          'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      interpretation = 'You have a normal body weight. Good job!';
    } else {
      interpretation =
          'You have a lower than normal body weight. You can eat a bt more.';
    }

    return interpretation;
  }
}
