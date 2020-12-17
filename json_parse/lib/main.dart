import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async{
  List _data = await getUser();

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Json Parse"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _data.length,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 20),
            itemBuilder: (BuildContext context, int position){

//              final index = position ~/ 2; // dividing position by 2 and returning integer result
              return new ListTile(
                title: new Text("${_data[position]['name']}",
                style: new TextStyle(
                  fontSize: 15.4,
                ),
                ),
                subtitle: new Text("Email : " + "${_data[position]['email']}" + "\n"
                    + "Street : " + "${_data[position]['address']['street']}" + "\n"
                    + "City : " + "${_data[position]['address']['city']}",
                style: new TextStyle(
                  fontStyle: FontStyle.italic,
                ),),
                leading: new CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: new Text("${_data[position]['name'][0]}",
                  style: new TextStyle(
                    fontSize: 18.4,
                    color: Colors.black,
                  ),
                  ),

                ),
                onTap: () {_showOnTapMessage(context, "Name : " + "${_data[position]['name']}"
                    "\n" + "Phone : " + "${_data[position]['phone']}" +
                    "\n" + "Website : " + "${_data[position]['website']}"
                );},
              );

            }),
      ),
    ),
  ));
}

void _showOnTapMessage(BuildContext context, String message){
  var alert = new AlertDialog(
    title: new Text("User Details"),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed: () {Navigator.pop(context);},
          child: new Text("OK"))
    ],
  );
  showDialog(context: context, child: alert);
}


Future<List> getUser() async{
  String apiURl = "https://jsonplaceholder.typicode.com/users";
  http.Response response = await http.get(apiURl);
  return json.decode(response.body);
}