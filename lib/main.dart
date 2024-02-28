import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee Game Basic'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void setLR() {
    rightDiceNumber = Random().nextInt(6) + 1;
    leftDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print("Left clicked");
                    setLR();
                  });
                },
                child: Image(
                  image: AssetImage("images/dice${leftDiceNumber}.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print("Right clicked");
                    rightDiceNumber = Random().nextInt(6) + 1;
                    leftDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image(
                  image: AssetImage("images/dice$rightDiceNumber.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
