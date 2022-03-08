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
        primarySwatch: Colors.grey,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TinyColor tc = TinyColor(Colors.blue);

    return Scaffold(
      appBar: AppBar(
        title: const Text("TinyColor2 Example"),
      ),
      body: ListView(
        children: <Widget>[
          _createListItem(
            title: "Original color",
            subtitle: """
TinyColor tc = TinyColor(Colors.blue)
Color c = Colors.blue
""",
            color: tc.color,
            showOr: false,
          ),
          _createListItem(
            title: "tc.lighten(20)",
            subtitle: "c.lighten(20)",
            color: tc.lighten(20).color,
          ),
          _createListItem(
            title: "tc.brighten(20)",
            subtitle: "c.brighten(20)",
            color: tc.brighten(20).color,
          ),
          _createListItem(
            title: "tc.darken(20)",
            subtitle: "c.darken(20)",
            color: tc.darken(20).color,
          ),
          _createListItem(
            title: "tc.tint(20)",
            subtitle: "c.tint(20)",
            color: tc.tint(20).color,
          ),
          _createListItem(
            title: "tc.shade(20)",
            subtitle: "c.shade(20)",
            color: tc.shade(20).color,
          ),
          _createListItem(
            title: "tc.desaturate(20)",
            subtitle: "c.desaturate(20)",
            color: tc.desaturate(20).color,
          ),
          _createListItem(
            title: "tc.saturate(20)",
            subtitle: "c.saturate(20)",
            color: tc.saturate(20).color,
          ),
          _createListItem(
            title: "tc.greyscale()",
            subtitle: "c.greyscale()",
            color: tc.greyscale().color,
          ),
          _createListItem(
            title: "tc.spin(90)",
            subtitle: "c.spin(90)",
            color: tc.spin(90).color,
          ),
          _createListItem(
            title: "tc.compliment()",
            subtitle: "c.complement()",
            color: tc.complement().color,
          ),
          _createListItem(
            title: "tc.mix(Colors.yellow, 20)",
            subtitle: "c.mix(Colors.yellow, 20)",
            color: tc.mix(Colors.yellow, 20).color,
          ),
        ],
      ),
    );
  }

  Widget _createListItem({
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
