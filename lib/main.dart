import 'package:bmi_calculator/screen/calculator.dart';
import 'package:bmi_calculator/screen/result.dart';
import 'package:flutter/material.dart';

import 'model/calculation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //home: Calculator(),
      home: Result(calculation: Calculation(age: 20, height: 176, weight: 59, gender: "Male"),),
    );
  }
}
