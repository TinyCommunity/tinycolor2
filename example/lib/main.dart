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
            ListTile(
              title: Text("Original color"),
              trailing: CircleAvatar(
                backgroundColor: tinyColor.color,
              ),
            ),
            ListTile(
              title: Text("lighten"),
              trailing:
                  CircleAvatar(backgroundColor: tinyColor.lighten().color),
            ),
            ListTile(
              title: Text("brighten"),
              trailing:
                  CircleAvatar(backgroundColor: tinyColor.brighten().color),
            ),
            ListTile(
              title: Text("darken"),
              trailing: CircleAvatar(backgroundColor: tinyColor.darken().color),
            ),
            ListTile(
              title: Text("tint"),
              trailing: CircleAvatar(backgroundColor: tinyColor.tint().color),
            ),
            ListTile(
              title: Text("shade"),
              trailing: CircleAvatar(backgroundColor: tinyColor.shade().color),
            ),
            ListTile(
              title: Text("desaturate"),
              trailing:
                  CircleAvatar(backgroundColor: tinyColor.desaturate().color),
            ),
            ListTile(
              title: Text("saturate"),
              trailing:
                  CircleAvatar(backgroundColor: tinyColor.saturate().color),
            ),
            ListTile(
              title: Text("spin"),
              trailing: CircleAvatar(backgroundColor: tinyColor.spin(90).color),
            ),
          ],
        ),
      ),
    );
  }
}
