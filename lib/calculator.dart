class Calculator {
  String _display = '0';
  double? _previousValue;
  String? _operation;
  bool _shouldResetDisplay = false;

  String get display => _display;

  void inputNumber(String number) {
    if (_shouldResetDisplay) {
      _display = number;
      _shouldResetDisplay = false;
    } else {
      if (_display == '0') {
        _display = number;
      } else {
        _display += number;
      }
    }
  }

  void inputDecimal() {
    if (_shouldResetDisplay) {
      _display = '0.';
      _shouldResetDisplay = false;
    } else {
      if (!_display.contains('.')) {
        _display += '.';
      }
    }
  }

  void inputOperation(String operation) {
    if (_operation != null && !_shouldResetDisplay) {
      calculate();
    }
    _previousValue = double.parse(_display);
    _operation = operation;
    _shouldResetDisplay = true;
  }

  void calculate() {
    if (_previousValue == null || _operation == null) {
      return;
    }

    double currentValue = double.parse(_display);
    double result;

    switch (_operation) {
      case '+':
        result = _previousValue! + currentValue;
        break;
      case '-':
        result = _previousValue! - currentValue;
        break;
      case '×':
        result = _previousValue! * currentValue;
        break;
      case '÷':
        if (currentValue == 0) {
          _display = 'Error';
          clear();
          return;
        }
        result = _previousValue! / currentValue;
        break;
      default:
        return;
    }

    // Format result to remove unnecessary decimals
    if (result % 1 == 0) {
      _display = result.toInt().toString();
    } else {
      _display = result.toString();
    }

    _previousValue = null;
    _operation = null;
    _shouldResetDisplay = true;
  }

  void clear() {
    _display = '0';
    _previousValue = null;
    _operation = null;
    _shouldResetDisplay = false;
  }
}
