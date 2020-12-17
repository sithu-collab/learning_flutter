import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _textFieldController = new TextEditingController();
  var _saveData = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSavedData();
  }
  _loadSavedData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if(preferences.getString('data') != null && preferences.getString('data').isNotEmpty){
        _saveData = preferences.getString("data");
      }else{
        _saveData = "Nothing happened!";
      }
    }); 
  }

  _savedMessage(String message) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('data', message);

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Read&Write"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(13.4),
        child: new ListTile(
          title: new TextField(
            controller: _textFieldController,
            decoration: new InputDecoration(
              labelText: 'Write Something',
            ),
          ),
          subtitle: new RaisedButton(onPressed: () {
              _savedMessage(_textFieldController.text);
          },
          child: new Column(
            children: <Widget>[
              new Text('Save Data'),
              new Padding(padding: const EdgeInsets.all(10.0)),
              new Text(_saveData),
            ],
          ),),

        ),

      ),
    );
  }
}





//
//Future<String> get _localPath async{
//  final directory = await getApplicationDocumentsDirectory();
//  return directory.path;
//}
//
//Future<File> get _localFile async{
//  final path = await _localPath;
//  return new File('$path/data.txt');
//}
////Write data to the file
//Future<File> writeData(String message) async{
//  final file = await _localFile;
//
//  return file.writeAsString('$message');
//}
//
//Future<String> readData() async{
//  try {
//    final file = await _localFile;
//    String data = await file.readAsString();
//    return data;
//  } on Exception catch (e) {
//    // TODO
//    return "Nothing happened!";
//  }
//
//}
