import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator', textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: BMICalculator(),
      ),
    );
  }
}