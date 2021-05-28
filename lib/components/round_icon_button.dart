import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: () {
        onPress();
      },
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: kHeightRoundIconButton,
        width: kWidthRoundIconButton,
      ),
      shape: CircleBorder(),
      fillColor: kRoundIconButtonBackground,
    );
  }
}
