import 'package:flutter/material.dart';

class ToolCalculator extends StatefulWidget {
  const ToolCalculator({Key? key}) : super(key: key);

  @override
  _ToolCalculatorState createState() => _ToolCalculatorState();
}

class _ToolCalculatorState extends State<ToolCalculator> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  String operation = '';
  String result = '';

  void onNumPressed(String num) {
    setState(() {
      if (operation.isEmpty) {
        firstNum = double.parse('$firstNum$num');
      } else {
        secondNum = double.parse('$secondNum$num');
      }
    });
  }

  void onOperationPressed(String op) {
    setState(() {
      operation = op;
    });
  }

  void onClearPressed() {
    setState(() {
      firstNum = 0.0;
      secondNum = 0.0;
      operation = '';
      if (result.startsWith('RESULT: ')) {
        result = '';
      }
    });
  }

  void onCalculatePressed() {
    setState(() {
      switch (operation) {
        case '+':
          result = '${firstNum + secondNum}';
          break;
        case '-':
          result = '${firstNum - secondNum}';
          break;
        case '*':
          result = '${firstNum * secondNum}';
          break;
        case '/':
          result = '${firstNum / secondNum}';
          break;
        default:
          result = '';
      }
      result = 'RESULT: $result';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    borderRadius: BorderRadius.circular(8),
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
                  child: Text('C'),
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