import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(30, (index) => "Items ${index + 1}");
      // dummy list 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Swipe to dismiss"),
        ),
        body: new ListView.builder(
          itemBuilder: (context, int index) {
            return new Dismissible(
                key: new Key(items[index]),
                onDismissed: (direction) {
                  items.remove(index);
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text("Item Dissmissed")));
                },
                background: new Container(
                  color: Colors.blueGrey
                ),
                child: new ListTile(
                  title: new Text(items[index]),
                ));
          },
          itemCount: items.length,
        ));
  }
}
