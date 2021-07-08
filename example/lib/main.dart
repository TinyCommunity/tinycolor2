import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

void main() {
  runApp(TinyColorApp());
}

class TinyColorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TinyColor2 Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tinyColor = TinyColor(Colors.blue);

    return Scaffold(
      appBar: AppBar(
        title: Text("TinyColor2 Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _createListItem(
              name: "Original color",
              color: tinyColor.color,
            ),
            _createListItem(
              name: "lighten",
              color: tinyColor.lighten(20).color,
            ),
            _createListItem(
              name: "brighten",
              color: tinyColor.brighten(20).color,
            ),
            _createListItem(
              name: "darken",
              color: tinyColor.darken(20).color,
            ),
            _createListItem(
              name: "tint",
              color: tinyColor.tint(20).color,
            ),
            _createListItem(
              name: "shade",
              color: tinyColor.shade(20).color,
            ),
            _createListItem(
              name: "desaturate",
              color: tinyColor.desaturate(20).color,
            ),
            _createListItem(
              name: "saturate",
              color: tinyColor.saturate(20).color,
            ),
            _createListItem(
              name: "spin",
              color: tinyColor.spin(90).color,
            ),
          ],
        ),
      ),
    );
  }

  _createListItem({
    required String name,
    required Color color,
  }) =>
      ListTile(
        title: Text(name),
        trailing: CircleAvatar(backgroundColor: color),
      );
}
