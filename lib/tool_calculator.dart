// import the required flutter library
import 'package:flutter/material.dart';

// create a stateful widget named ToolCalculator
class ToolCalculator extends StatefulWidget {
  const ToolCalculator({Key? key}) : super(key: key);

  @override
  // create an instance of the stateful widget
  _ToolCalculatorState createState() => _ToolCalculatorState();
}

// create the state for the ToolCalculator widget
class _ToolCalculatorState extends State<ToolCalculator> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  String operation = '';
  String result = '';

  // create a function to handle the number button presses
  void onNumPressed(String num) {
    setState(() {
      if (operation.isEmpty) {
        firstNum = double.parse('$firstNum$num');
      } else {
        secondNum = double.parse('$secondNum$num');
      }
    });
  }

  // create a function to handle the operation button presses
  void onOperationPressed(String op) {
    setState(() {
      operation = op;
    });
  }

  // Define a function called "onClearPressed"
  void onClearPressed() {
    // Call the "setState" method
    setState(() {
      // Set "firstNum" and "secondNum" to 0
      firstNum = 0.0;
      secondNum = 0.0;
      // Set "operation" to an empty string
      operation = '';
      // If "result" starts with "RESULT: ", set "result" to an empty string
      if (result.startsWith('RESULT: ')) {
        result = '';
      }
    });
  }

// Define a function called "onCalculatePressed"
  void onCalculatePressed() {
    // Call the "setState" method
    setState(() {
      // Use a switch statement to determine the appropriate mathematical operation based on the value of "operation"
      switch (operation) {
        // If "operation" is "+", set "result" to the sum of "firstNum" and "secondNum"
        case '+':
          result = '${firstNum + secondNum}';
          // If "result" starts with "RESULT: ", set "result" to an empty string
          if (result.startsWith('RESULT: ')) {
            result = '';
          }
          break;
        // If "operation" is "-", set "result" to the difference of "firstNum" and "secondNum"
        case '-':
          result = '${firstNum - secondNum}';
          break;
        // If "operation" is "*", set "result" to the product of "firstNum" and "secondNum"
        case '*':
          result = '${firstNum * secondNum}';
          break;
        // If "operation" is "/", set "result" to the quotient of "firstNum" and "secondNum"
        case '/':
          result = '${firstNum / secondNum}';
          break;
        // If "operation" is not one of the above cases, set "result" to an empty string
        default:
          result = '';
      }
      // Add "RESULT: " to the beginning of "result"
      result = 'RESULT: $result';
    });
  }
  // This code overrides the build method of a StatefulWidget to build the app's user interface.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sets the app bar, which is a Material Design widget at the top of the screen that typically contains the app's title and navigation.
      appBar: AppBar(
        title: Text('Tool Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '$firstNum',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '$operation',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '$secondNum',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              result,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onNumPressed('1'),
                  child: Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => onNumPressed('2'),
                  child: Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => onNumPressed('3'),
                  child: Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => onOperationPressed('+'),
                  child: Text('+'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onNumPressed('4'),
                  child: Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => onNumPressed('5'),
                  child: Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => onNumPressed('6'),
                  child: Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => onOperationPressed('-'),
                  child: Text('-'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onNumPressed('7'),
                  child: Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => onNumPressed('8'),
                  child: Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => onNumPressed('9'),
                  child: Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => onOperationPressed('*'),
                  child: Text('*'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onClearPressed,
                  child: Text('CLR'),
                ),
                ElevatedButton(
                  onPressed: () => onNumPressed('0'),
                  child: Text('0'),
                ),
                ElevatedButton(
                  onPressed: onCalculatePressed,
                  child: Text('='),
                ),
                ElevatedButton(
                  onPressed: () => onOperationPressed('/'),
                  child: Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}