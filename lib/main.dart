import 'package:flutter/material.dart';

import 'screens/input_page.dart';
import 'constant.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor, primaryColor: kprimaryColor),
      home: InputPage(),
    );
  }
}
