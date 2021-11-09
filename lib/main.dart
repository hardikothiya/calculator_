import 'package:calculator_demo/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButton(
                      buttonText: buttons[index],
                      color: Colors.green,
                      textcolor: Colors.white,
                    );
                  } else if (index == 1) {
                    return MyButton(
                      buttonText: buttons[index],
                      color: Colors.red,
                      textcolor: Colors.white,
                    );
                  } else {
                    return MyButton(
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
}

bool isOperator(String x) {
  if (x == '%' || x == '+' || x == '-' || x == '/' || x == '=' || x == '*') {
    return true;
  } else {
    return false;
  }
}
