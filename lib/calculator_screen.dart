import 'package:flutter/material.dart';

import 'calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final Calculator _calculator = Calculator();

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _calculator.clear();
      } else if (value == '=') {
        _calculator.calculate();
      } else if (value == '.') {
        _calculator.inputDecimal();
      } else if (['+', '-', '×', '÷'].contains(value)) {
        _calculator.inputOperation(value);
      } else {
        _calculator.inputNumber(value);
      }
    });
  }

  Widget _buildButton(String text, {Color? backgroundColor, Color? textColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? const Color(0xFFD4D4D4),
            foregroundColor: textColor ?? Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(20),
            elevation: 2,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Display area
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Text(
                  _calculator.display,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            // Button grid
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // Row 1: C, ÷, ×, -
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('C'),
                          _buildButton(
                            '÷',
                            backgroundColor: const Color(0xFFFF9500),
                            textColor: Colors.white,
                          ),
                          _buildButton(
                            '×',
                            backgroundColor: const Color(0xFFFF9500),
                            textColor: Colors.white,
                          ),
                          _buildButton(
                            '-',
                            backgroundColor: const Color(0xFFFF9500),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    // Row 2: 7, 8, 9, +
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton('7'),
                          _buildButton('8'),
                          _buildButton('9'),
                          _buildButton(
                            '+',
                            backgroundColor: const Color(0xFFFF9500),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    // Rows 3-5: Numbers on left, = button spanning 3 rows on right
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          // Left side: 3 rows of numbers
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                // Row 3: 4, 5, 6
                                Expanded(
                                  child: Row(
                                    children: [
                                      _buildButton('4'),
                                      _buildButton('5'),
                                      _buildButton('6'),
                                    ],
                                  ),
                                ),
                                // Row 4: 1, 2, 3
                                Expanded(
                                  child: Row(
                                    children: [
                                      _buildButton('1'),
                                      _buildButton('2'),
                                      _buildButton('3'),
                                    ],
                                  ),
                                ),
                                // Row 5: 0, . (decimal point)
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          margin: const EdgeInsets.all(4),
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                _onButtonPressed('0'),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                0xFFD4D4D4,
                                              ),
                                              foregroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              padding: const EdgeInsets.all(20),
                                              elevation: 2,
                                            ),
                                            child: const Text(
                                              '0',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      _buildButton('.'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right side: = button spanning all 3 rows
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              child: SizedBox.expand(
                                child: ElevatedButton(
                                  onPressed: () => _onButtonPressed('='),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF9500),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.all(20),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    '=',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Mentor credit
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Text(
                'Esam Ghanem',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
