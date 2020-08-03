import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class KeyPad extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CalcKey(Keys.clear),
            CalcKey(Keys.sign),
            CalcKey(Keys.percent),
            CalcKey(Keys.divide),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey(Keys.seven),
            CalcKey(Keys.eight),
            CalcKey(Keys.nine),
            CalcKey(Keys.multiply),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey(Keys.four),
            CalcKey(Keys.five),
            CalcKey(Keys.six),
            CalcKey(Keys.subtract),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey(Keys.one),
            CalcKey(Keys.two),
            CalcKey(Keys.three),
            CalcKey(Keys.add),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey(Keys.zero),
            CalcKey(Keys.decimal),
            CalcKey(Keys.equals),
          ],
        )
      ],
    );
  }
}

enum KeyType { FUNC, OP, INT }

class KeySymbol {
  const KeySymbol(this.val, this.type);
  final String val;
  final KeyType type;
}

class Keys {
  // FUNCTIONS
  static KeySymbol clear = const KeySymbol('C', KeyType.FUNC);
  static KeySymbol sign = const KeySymbol('±', KeyType.FUNC);
  static KeySymbol percent = const KeySymbol('%', KeyType.FUNC);
  static KeySymbol decimal = const KeySymbol('.', KeyType.FUNC);
  // OPERATORS
  static KeySymbol divide = const KeySymbol('÷', KeyType.OP);
  static KeySymbol multiply = const KeySymbol('x', KeyType.OP);
  static KeySymbol subtract = const KeySymbol('-', KeyType.OP);
  static KeySymbol add = const KeySymbol('+', KeyType.OP);
  static KeySymbol equals = const KeySymbol('=', KeyType.OP);
  // INTEGERS
  static KeySymbol zero = const KeySymbol('0', KeyType.INT);
  static KeySymbol one = const KeySymbol('1', KeyType.INT);
  static KeySymbol two = const KeySymbol('2', KeyType.INT);
  static KeySymbol three = const KeySymbol('3', KeyType.INT);
  static KeySymbol four = const KeySymbol('4', KeyType.INT);
  static KeySymbol five = const KeySymbol('5', KeyType.INT);
  static KeySymbol six = const KeySymbol('6', KeyType.INT);
  static KeySymbol seven = const KeySymbol('7', KeyType.INT);
  static KeySymbol eight = const KeySymbol('8', KeyType.INT);
  static KeySymbol nine = const KeySymbol('9', KeyType.INT);
}

class CalcKey extends StatelessWidget {
  CalcKey(this.symbol);

  final KeySymbol symbol;
  static dynamic _fire(CalcKey key) => KeyController.fire(KeyEvent(key));


  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4;
    TextStyle style = Theme.of(context).textTheme.headline4.copyWith(color: symbol.type == KeyType.INT ? Color(0xFF77978C) : Color(0xFFFFF2DF));

    return Container(
        width: symbol.val == '0' ? size * 2 : size,
        padding: EdgeInsets.all(1),
        height: size,
        child: RaisedButton(
          color: symbol.type == KeyType.INT ? Color(0xFFFFF2DF) : Color(0xFF77978C),
          child: Text(symbol.val, style: style),
          onPressed: () {
            _fire(this);
            HapticFeedback.heavyImpact();
          },
        )
    );
  }
}

class KeyEvent {
  KeyEvent(this.key);
  final CalcKey key;
}

class KeyController {
  static StreamController _controller = StreamController();
  static Stream get _stream => _controller.stream;

  static StreamSubscription listen(Function handler) => _stream.listen(handler as dynamic);
  static void fire(KeyEvent event) => _controller.add(event);

  static dispose() => _controller.close();
}