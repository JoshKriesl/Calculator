import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  Display({ Key key, this.val}) : super(key: key);

  final String val;

  @override
  Widget build(BuildContext context) {

    TextStyle style = Theme.of(context).textTheme.headline3
        .copyWith(fontWeight: FontWeight.w200);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
        child: Align(
          alignment: Alignment.bottomRight,
            child: Text(val, style: style, textAlign: TextAlign.right)
        ),
      )
    );
  }
}