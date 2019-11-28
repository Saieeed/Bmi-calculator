import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart' show ReusableWidge;
import 'Icon_card.dart' show CardView;
import 'constants.dart';
import 'round_button.dart';
import 'result_page.dart';
import 'sumit_button.dart';

Gender gendertype;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}



int number = 130;
int weight = 60;
int age = 20;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableWidge(
                      onPress: () {
                        setState(() {
                          gendertype = Gender.male;
                        });
                      },
                      colour: gendertype == Gender.male
                          ? kInactivecolor
                          : kActivecolor,
                         cardChild: CardView(
                        x: FontAwesomeIcons.mars,
                        y: "Male",
                      ),
                    )),
                    Expanded(
                      child: ReusableWidge(
                        onPress: () {
                          setState(() {
                            gendertype = Gender.female;
                          });
                        },
                        colour: gendertype == Gender.female
                            ? kInactivecolor
                            : kActivecolor,
                        cardChild: CardView(
                          x: FontAwesomeIcons.venus,
                          y: "DishWasher",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Expanded(
                flex: 3,
                  child: ReusableWidge(
                colour: kActivecolor,
                  cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          number.toString(),
                          style: kTextstyle2,
                        ),
                        Text(
                          'cm',
                          style: kTextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0),
                      ),
                      child: Slider(
                        onChanged: (double n) {
                          setState(() {
                            number = n.round();
                          });
                        },
                        value: number.toDouble(),
                        min: 120.0,
                        max: 220.0,
                      ),
                    )
                  ],
                ),
              )),
            ),
            Container(
              child: Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableWidge(
                      colour: kActivecolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kTextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kTextstyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 2.0,
                                height: 2.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                    Container(
                      child: Expanded(
                          child: ReusableWidge(
                        colour: kActivecolor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE', style: kTextstyle),
                            Text(
                              age.toString(),
                              style: kTextstyle2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 2.0,
                                  height: 2.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 100.0,
                height: 120.0,
                child:
                submit_button(onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return new ResultPage();
/*
            AlertDialog(
            title: Text("the best weight for you is "),
            content: Text(bestweight.toString()),
          );
           */
                  }));
                } , text: 'Calculate',),
              ),
            )
          ],
        ));
  }
}

// ignore: camel_case_types
