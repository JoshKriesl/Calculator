import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            CalcKey('1'),
            CalcKey('2'),
            CalcKey('3'),
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
            CalcKey('7'),
            CalcKey('8'),
            CalcKey('9'),
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
            HapticFeedback.heavyImpact();
          },
        )
    );
  }
}