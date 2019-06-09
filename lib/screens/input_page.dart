import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';

import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 75;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: new IconContent(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onCardTap: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: new IconContent(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onCardTap: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cms.',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x90EB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (newHeight) {
                        setState(() {
                          height = newHeight.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onCardTap: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCardButtons(
                    label: 'WEIGHT',
                    value: weight.toString(),
                    onPressFirstButton: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onPressedSecondButton: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCardButtons(
                    label: 'AGE',
                    value: age.toString(),
                    onPressFirstButton: () {
                      setState(() {
                        age--;
                      });
                    },
                    onPressedSecondButton: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calculatorBrain =
                  new CalculatorBrain(height: height, weight: weight);
              calculatorBrain.calculateBMI();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmiResult: calculatorBrain.getBMI(),
                          interpretation: calculatorBrain.getInterpretation(),
                          resultText: calculatorBrain.getResult())));
            },
            child: Container(
              color: kButtonContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'CALCULATE BMI',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCardButtons extends StatelessWidget {
  final String label;
  final String value;
  final Function onPressFirstButton;
  final Function onPressedSecondButton;

  ReusableCardButtons(
      {this.label,
      this.value,
      this.onPressFirstButton,
      this.onPressedSecondButton});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.label,
            style: kLabelStyle,
          ),
          Text(
            this.value,
            style: kNumberTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: () {
                  this.onPressFirstButton();
                },
              ),
              SizedBox(width: 10.0),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: () {
                  this.onPressedSecondButton();
                },
              ),
            ],
          ),
        ],
      ),
      onCardTap: () {},
    );
  }
}
