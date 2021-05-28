import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class CalculateWidget extends StatefulWidget {
  final String label;
  final int number;
  final Function onPressAdd;
  final Function onPressDec;

  CalculateWidget(this.label, this.number, this.onPressAdd, this.onPressDec);

  @override
  _CalculateWidgetState createState() =>
      _CalculateWidgetState(label, number, onPressAdd, onPressDec);
}

class _CalculateWidgetState extends State<CalculateWidget> {
  _CalculateWidgetState(
      this.label, this.number, this.onPressAdd, this.onPressDec);

  final Function onPressAdd;
  final Function onPressDec;
  final String label;
  int number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: kLabelTextStyle,
            ),
            Text(
              number.toString(),
              style: kNumberLabelStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    onPress: () {
                      onPressDec();
                      number--;
                    }),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                    icon: FontAwesomeIcons.plus,
                    onPress: () {
                      onPressAdd();
                      number++;
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
