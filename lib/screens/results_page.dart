import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/bottom_button.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.bmi,
      @required this.bmitext,
      @required this.bmiinterpretation});
  final String bmi;
  final String bmitext;
  final String bmiinterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmitext.toUpperCase(),
                    style: kBmiTitleStyle,
                  ),
                  Text(
                    bmi,
                    style: kBmiValueStyle,
                  ),
                  Text(
                    bmiinterpretation,
                    textAlign: TextAlign.center,
                    style: kBmiBodyStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'RE-CALCULATE',
              ontap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
