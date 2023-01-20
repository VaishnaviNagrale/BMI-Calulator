import 'package:flutter/material.dart';
import 'package:bmi_calculator/HomePage.dart';
void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0E21),
          scaffoldBackgroundColor: Color(0xff0A0E21),
          appBarTheme: AppBarTheme(
            color: Color(0xff0A0E21),
            centerTitle: true,
            //shadowColor: Colors.grey,
          ),
      ),
      home: BMIapp(),
    );
  }
}
