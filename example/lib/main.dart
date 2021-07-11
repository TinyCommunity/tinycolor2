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
    var c = TinyColor(Colors.blue);

    return Scaffold(
      appBar: AppBar(
        title: Text("TinyColor2 Example"),
      ),
      body: ListView(
        children: <Widget>[
          _createListItem(
            title: "Original color",
            subtitle: "var c = TinyColor(Colors.blue)",
            color: c.color,
            showOr: false,
          ),
          _createListItem(
            title: "c.lighten(20)",
            subtitle: "Colors.blue.lighten(20)",
            color: c.lighten(20).color,
          ),
          _createListItem(
            title: "c.brighten(20)",
            subtitle: "Colors.blue.brighten(20)",
            color: c.brighten(20).color,
          ),
          _createListItem(
            title: "c.darken(20)",
            subtitle: "Colors.blue.darken(20)",
            color: c.darken(20).color,
          ),
          _createListItem(
            title: "c.tint(20)",
            subtitle: "Colors.blue.tint(20)",
            color: c.tint(20).color,
          ),
          _createListItem(
            title: "c.shade(20)",
            subtitle: "Colors.blue.shade(20)",
            color: c.shade(20).color,
          ),
          _createListItem(
            title: "c.desaturate(20)",
            subtitle: "Colors.blue.desaturate(20)",
            color: c.desaturate(20).color,
          ),
          _createListItem(
            title: "c.saturate(20)",
            subtitle: "Colors.blue.saturate(20)",
            color: c.saturate(20).color,
          ),
          _createListItem(
            title: "c.greyscale()",
            subtitle: "Colors.blue.greyscale()",
            color: c.greyscale().color,
          ),
          _createListItem(
            title: "c.spin(90)",
            subtitle: "Colors.blue.spin(90)",
            color: c.spin(90).color,
          ),
          _createListItem(
            title: "c.compliment()",
            subtitle: "Colors.blue.complement()",
            color: c.complement().color,
          ),
          _createListItem(
            title: "c.mix(input: Colors.yellow, amount: 20)",
            subtitle: "Colors.blue.mix(Colors.yellow, 20)",
            color: c.mix(input: Colors.yellow, amount: 20).color,
          ),
        ],
      ),
    );
  }

  _createListItem({
    required String title,
    required String subtitle,
    required Color color,
    bool showOr = true,
  }) =>
      ListTile(
        title: Text(title),
        subtitle: Text("${showOr ? "or: " : ""}$subtitle"),
        trailing: CircleAvatar(backgroundColor: color),
      );
}
