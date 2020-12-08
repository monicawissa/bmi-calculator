import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'componont/card.dart';
import 'componont/icon_roundButton.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'componont/icon_content.dart';
import 'componont/bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { female, male }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    coulor: (selectedGender == Gender.male)
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    card:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    coulor: (selectedGender == Gender.female)
                        ? kactiveCardColor
                        : kinactiveCardColor,
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    card: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'female'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              coulor: kactiveCardColor,
              card: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.grey,
                      activeTrackColor: Colors.white,
                      overlayColor: koverlayBottomContainerColour,
                      thumbColor: kBottomContainerColour,
                      //extra
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      label: height.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    coulor: kactiveCardColor,
                    card: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          backgroundColor: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    coulor: kactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              // CalculatorBrain calc =
              //     CalculatorBrain(height: height, weight: weight);
              //
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ResultsPage(
              //       bmiResult: calc.calculateBMI(),
              //       resultText: calc.getResult(),
              //       interpretation: calc.getInterpretation(),
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
