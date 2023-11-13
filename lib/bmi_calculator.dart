import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0.0;
  String bmiCategory = '';

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;
    double calculatedBMI = weight / ((height / 100) * (height / 100));
    String category = interpretBMI(calculatedBMI);

    setState(() {
      bmi = calculatedBMI;
      bmiCategory = category;
    });
  }

  String interpretBMI(double bmi) {

    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal Weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Height (cm)'),
          ),
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Weight (kg)'),
          ),
          ElevatedButton(
            onPressed: calculateBMI,
            child: Text('Calculate BMI'),
          ),
          SizedBox(height: 16),
          Text(
            'BMI: $bmi',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Category: $bmiCategory',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
