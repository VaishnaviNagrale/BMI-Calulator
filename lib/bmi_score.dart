import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/HomePage.dart';
import 'package:bmi_calculator/Reusable_Card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/calculator_brain.dart';
double score= (weight/(height*height));

class BMIscore extends StatelessWidget {
  BMIscore({required this.score,required this.txt,required this.interpTxt});
  final String score;
  final String txt;
  final String interpTxt;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
          actions: [
            Icon(Icons.view_headline_sharp,),
          ],
          backgroundColor: const Color(0xff0A0E21),
          centerTitle: true,
          title: Text('BMI SCORE',style: TextStyle(
            color: Colors.white,
          ),),
        ),
        body: Container(
          color: kInactiveCardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('YOUR RESULT',style: kTextStyle,textAlign: TextAlign.right,),
                SizedBox(
                  height: 600,
                 width: double.infinity,
                 child: ReuseableCard(
                   colour: kActiveCardColor,
                   cardChild:  Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(txt.toUpperCase(),style: kResultTextStyle),
                       Text(score,style: kBMItextStyle),
                       Text(interpTxt,style: kBodyTextStyle,textAlign: TextAlign.center,),
                     ],
                   ),
                 ),
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          width: double.infinity,
          child: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            shape: RoundedRectangleBorder(),
            backgroundColor: kBottomContainerCardColor,
            child: Center(child: Text('Re-Calculate',style: TextStyle(color: Colors.white)),),
          ),
        ),
        ),
    );
  }
}
