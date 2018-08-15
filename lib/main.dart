import 'package:flutter/material.dart';

import 'FixDropDown.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'DropDown Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _list = [
    'Create beautiful apps faster with Flutter’s collection of visual',
    'Visual, behavioral, and motion-rich widgets implementing the Material Design guidelines.',
    'Material Components'
  ];

  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Text(
                "OverflowingDropDown Demo",
                style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: new FixDropDown(
                  isDense: false,
                  items: _list.map((String value) {
                    return new FixDropdownMenuItem(
                      value: value,
                      child: new Text(
                        value,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    );
                  }).toList(),
                  hint: new Text(
                    selectedValue != "" ? selectedValue : "Please Select",
                    maxLines: 1,
                    softWrap: true,
                  ),
                  onChanged: (String value) {
                    setState(() {
                      selectedValue = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
