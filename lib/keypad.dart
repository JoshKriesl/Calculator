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
            CalcKey('CE'),
            CalcKey('C'),
            CalcKey('%'),
            CalcKey('÷'),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey('7'),
            CalcKey('8'),
            CalcKey('9'),
            CalcKey('x'),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey('4'),
            CalcKey('5'),
            CalcKey('6'),
            CalcKey('-'),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey('1'),
            CalcKey('2'),
            CalcKey('3'),
            CalcKey('+'),
          ],
        ),
        Row(
          children: <Widget>[
            CalcKey('0'),
            CalcKey('.'),
            CalcKey('='),
          ],
        )
      ],
    );
  }
}

class CalcKey extends StatelessWidget {
  CalcKey(this.symbol);

  final String symbol;
  static dynamic _fire(CalcKey key) => KeyController.fire(KeyEvent(key));


  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4;
    TextStyle style = Theme.of(context).textTheme.headline4.copyWith(color: Colors.white);

    return Container(
        width: symbol == '0' ? size * 2 : size,
        padding: EdgeInsets.all(1),
        height: size,
        child: FlatButton(
          color: Colors.cyan,
          child: Text(symbol, style: style),
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