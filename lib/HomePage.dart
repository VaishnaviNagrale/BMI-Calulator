import 'dart:ui';
import 'package:bmi_calculator/bmi_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';
import 'Icon_Content.dart';
import 'Reusable_Card.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender{male,female}
int height=1;
int weight=60;
int Age=20;

class BMIapp extends StatefulWidget {
  const BMIapp({Key? key}) : super(key: key);

  @override
  State<BMIapp> createState() => _BMIappState();
}

class _BMIappState extends State<BMIapp> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  void updateColor(Gender g){
    if(g==Gender.male){
      if(maleCardColor==kInactiveCardColor){
        maleCardColor=kActiveCardColor;
        femaleCardColor=kInactiveCardColor;
      }else{
        maleCardColor=kInactiveCardColor;
        // femaleCardColor=activeCardColor;
      }
    }
    if(g==Gender.female){
      if(femaleCardColor==kInactiveCardColor){
        femaleCardColor=kActiveCardColor;
        maleCardColor=kInactiveCardColor;
      }else{
        femaleCardColor=kInactiveCardColor;
        // maleCardColor=activeCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: const Color(0xff0A0E21),
        title: const Text('BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        print('Male ');
                        setState(() {
                         updateColor(Gender.male);
                        });
                      },
                      child: ReuseableCard(colour: maleCardColor,cardChild: IconContent(
                        IconLook: FontAwesomeIcons.mars,
                        Label: 'Male',
                      ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        print('Female');
                        setState(() {
                          updateColor(Gender.female);
                        });
                      },
                      child: ReuseableCard(colour: femaleCardColor, cardChild: IconContent(
                        IconLook: FontAwesomeIcons.venus,
                        Label: 'Female',
                      ),
                      ),
                    ),
                  ),
                ],
              ),),
          Expanded(
            child: ReuseableCard(colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height',style: labelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                      style:kNumTextstyle),
                      Text('cm',
                      style: kNumTextstyle,),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:  RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape : RoundSliderOverlayShape(overlayRadius: 30.0),
                    ), child: const Text(''),
                  ),
                  Slider(
                    value: height.toDouble(),
                      min: 0.0,
                      max: 220.0,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.pinkAccent,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReuseableCard(colour: kActiveCardColor,
                    cardChild: Column(
                    children: [
                      Text('Weight',style: labelTextStyle),
                      Text(weight.toString(),style: kNumTextstyle,),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                if(weight>0){
                                  weight--;
                                }else{
                                 weight=0;
                                }
                              });
                            },
                            shape: CircleBorder(),
                            backgroundColor: Colors.grey,
                            child: Icon(FontAwesomeIcons.minus,size: 40.0,),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            shape: CircleBorder(),
                            backgroundColor: Colors.grey,
                            child: Icon(FontAwesomeIcons.plus,size: 40.0,),
                          ),
                        ],
                      )
                    ],
                    ),),
                ),
                Expanded(
                  child: ReuseableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      children: [
                        Text('Age',style: labelTextStyle),
                        Text(Age.toString(),style: kNumTextstyle,),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  if(Age>0){
                                    Age--;
                                  }else{
                                    Age=0;
                                  }
                                });
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.grey,
                              child: Icon(FontAwesomeIcons.minus,size: 40.0,),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  Age++;
                                });
                              },
                              shape: CircleBorder(),
                              backgroundColor: Colors.grey,
                              child: Icon(FontAwesomeIcons.plus,size: 40.0,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
             SizedBox(
               height: 60.0,
             )
        ],
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: FloatingActionButton(
          onPressed: (){
            Calculator_brain cal =Calculator_brain(height: height,weight: weight);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> BMIscore(
                score: cal.calculateBMI(),
                txt: cal.getResult(),
                interpTxt: cal.getInterpretation(),
              ),
              ),);
          },
          shape: RoundedRectangleBorder(),
          backgroundColor: kBottomContainerCardColor,
          child: Center(child: Text('Calculate Your BMI',style: TextStyle(color: Colors.white)),),
        ),
      ),
    );
  }
}
