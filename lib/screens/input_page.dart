import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/calculate_widget.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/icon_content.dart';
import '../components/bottom_button.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender? selectedGender;
  int heightUser = 180;
  int weightUser = 60;
  int ageUser = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                          },
                        );
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.female;
                          },
                        );
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild:
                          IconContent(icon: Icons.female, label: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          heightUser.toString(),
                          style: kNumberLabelStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: kSliderActiveColor,
                        overlayColor: kSliderOverlayColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: heightUser.toDouble(),
                        min: kHeightSliderMin,
                        max: kHeightSliderMax,
                        onChanged: (double newValue) {
                          setState(
                            () {
                              heightUser = newValue.round();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  CalculateWidget('WEIGHT', weightUser, () {
                    setState(
                      () {
                        weightUser++;
                      },
                    );
                  }, () {
                    setState(
                      () {
                        weightUser--;
                      },
                    );
                  }),
                  CalculateWidget(
                    'AGE',
                    ageUser,
                    () {
                      setState(
                        () {
                          ageUser++;
                        },
                      );
                    },
                    () {
                      setState(
                        () {
                          ageUser--;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            BottomButton(
              text: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: heightUser, weight: weightUser);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.getBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
