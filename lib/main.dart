import 'package:calculator_demo/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  var userQuestion = '';
  var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292D32),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 16.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 16.0,
                  ),
                ],
                color: Color(0xFFEFEEEE),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50.0),
                  Container(
                      padding: EdgeInsets.all(20.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: TextStyle(fontSize: 20.0),
                      )),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 16.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 16.0,
                  ),
                ],
                color: Color(0xFF292D32),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  //clear
                  if (index == 0) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.green,
                      textcolor: Colors.black,
                    );
                    //delete
                  } else if (index == 1) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red,
                      textcolor: Colors.black,
                    );
                  }
                  //equal
                  else if (index == buttons.length - 1) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red,
                      textcolor: Colors.black,
                    );
                  } else {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.purple
                          : Colors.purple.shade50,
                      textcolor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    // finalQuestion= finalQuestion.replaceAll('from', replace)

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}

bool isOperator(String x) {
  if (x == '%' || x == '+' || x == '-' || x == '/' || x == '=' || x == '*') {
    return true;
  } else {
    return false;
  }
}
