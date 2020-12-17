import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _firstFieldController = new TextEditingController();

  Future _gotoNextScreen() async {
    Map result = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new NextScreen(
        name: _firstFieldController.text,
      );
    }));
    if (result != null && result.containsKey("info")) {
      _firstFieldController.text = result['info'].toString();
    } else {
      debugPrint("Nothing...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("First Screen"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _firstFieldController,
              decoration: new InputDecoration(labelText: 'Enter Your Name'),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              onPressed: () {
                _gotoNextScreen();
              },
              child: new Text("Send Data to Second"),
            ),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;

  const NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _backFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text("${widget.name}"),
          ),
          new ListTile(
            title: new TextField(
              controller: _backFieldController,
              decoration: new InputDecoration(labelText: 'Type Something'),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              onPressed: () {
                Navigator.pop(context, {'info': _backFieldController.text});
              },
              child: new Text("Send Data to First"),
            ),
          )
        ],
      ),
    );
  }
}
