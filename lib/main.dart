import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basit Hesap Makinesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = "";

  void _calculate(String operator) {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    double calcResult;

    switch (operator) {
      case '+':
        calcResult = num1 + num2;
        break;
      case '-':
        calcResult = num1 - num2;
        break;
      case '*':
        calcResult = num1 * num2;
        break;
      case '/':
        calcResult = num1 / num2;
        break;
      default:
        calcResult = 0.0;
    }

    setState(() {
      result = calcResult.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basit Hesap Makinesi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Birinci Sayı',
              ),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'İkinci Sayı',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Sonuç: $result',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
