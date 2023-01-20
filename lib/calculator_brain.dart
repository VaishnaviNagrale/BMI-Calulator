import 'package:flutter/material.dart';
import 'dart:math';

import 'bmi_score.dart';

class Calculator_brain {
  Calculator_brain({required this.height,required this.weight});
  final int height;
  final int weight;
  double score=0.0;
   String calculateBMI(){
      score= weight/pow(height/100,2);
     return score.toStringAsFixed(1);
   }
   String getResult(){
     if(score<=18.5){
       return 'Underweight';
     }
     else if(score>18.5 && score<=24.9){
       return 'Normal Weight';
     }
     else if(score>25 && score<=29.9){
       return 'Pre-obesity';
     }
     else if(score>30 && score<=34.9){
       return 'Obesity class-I';
     }
     else if(score>35 && score<=39.9){
       return 'Obesity class-II';
     }
     else if(score>40){
       return 'Obesity class-III';
     }
     return 'NULL';
   }
   String getInterpretation(){
     if(score<=18.5){
       return 'Eat more';
     }
     else if(score>18.5 && score<=24.9){
       return 'You are healthy';
     }
     else if(score>25 && score<=29.9){
       return 'You will be fat';
     }
     else if(score>30 && score<=34.9){
       return 'Do yoga';
     }
     else if(score>35 && score<=39.9){
       return 'Avoid fast-food';
     }
     else if(score>40){
       return 'Consult ditetion';
     }
     return 'NULL';
   }
}