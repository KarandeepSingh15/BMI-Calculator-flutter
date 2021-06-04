import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/gender_card.dart';
import '../constants.dart';
import '../components/roundicon_button.dart';
import '../components/bottom_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      colour: selectedgender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardchild: GenderCard(
                        gender: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      colour: selectedgender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardchild: GenderCard(
                        gender: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardchild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: kDigitTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8DE98),
                        trackHeight: 2,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayColor: Color(0x29EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Color(0xFF8DE98),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                colour: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kDigitTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kDigitTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              title: 'CALCULATE',
              ontap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Results(
                        bmi: calc.bmicalculator(),
                        bmiinterpretation: calc.bmiinterpretation(),
                        bmitext: calc.bmitext(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ));
  }
}
