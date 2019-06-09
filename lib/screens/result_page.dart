import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
                child: Text(
              'Your Result',
              style: kTitleTextStyle,
            )),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(fontSize: 18.0, color: Colors.green),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              onCardTap: null,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kButtonContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'RECALCULATE BMI',
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
