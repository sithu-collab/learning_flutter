import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  List _data = await getJson();
  //print(_data);
  String _body = "";

//  for(int i = 0; i < _data.length; i++){
//    print("Title : $_data[i]['title']");
//    print("Body : $_data[i]['body']");
//
//  }
 _body = _data[0]['body'];

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Json Parse'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: new Center(
          child: new ListView.builder(
            itemCount: _data.length,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (BuildContext context, int position){
               if(position.isEven) return new Divider();
                final index = position ~/ 2;//dividing position by 2 and returning integer result
                return new ListTile(
                  title: new Text("${_data[index]['title']}",
                  style: TextStyle(
                    fontSize: 15.4,
                  ),
                  ),
                  leading: new CircleAvatar(
                    backgroundColor: Colors.green,
                    child: new Text("${_data[index]['title'][0]}",
                    style: new TextStyle(
                      fontSize: 18.4,
                    ),),
                  ),
                  subtitle: new Text("${_data[index]['body']}",
                  style: new TextStyle(
                    fontStyle: FontStyle.italic,
                  ),),
                 onTap: () {_showOnTapMessage(context, "${_data[index]['title']}"); }
                 // onTap: () => debugPrint("${_data[index]['id']}"),
                );


      })

        ),
    ),
  ));
}

void _showOnTapMessage(BuildContext context, String message){
  var alert = new AlertDialog(
    title: new Text("App"),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: () => (Navigator.pop(context)),
          child: new Text("OK"))
    ],
  );
  showDialog(context: context, child: alert);
}

Future<List> getJson() async{
  String apiURl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response= await http.get(apiURl);
  return json.decode(response.body);//it return List type
}