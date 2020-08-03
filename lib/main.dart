import 'package:calculator/solver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator/keypad.dart';
import 'package:calculator/display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Calco',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Mulish'
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = '';

  @override
  void initState() {
    KeyController.listen((event) => Solver.process(event));
    Solver.listen((data) => setState(() { _output = data; }));
    Solver.refresh();
    super.initState();
  }

  @override
  void dispose() {
    KeyController.dispose();
    Solver.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Display(val: _output),
          KeyPad()
        ],
      )
    );
  }
}
