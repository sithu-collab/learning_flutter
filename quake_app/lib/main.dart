import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map _data;
List _features;
void main() async{
   _data = await getQuakes();
   _features = _data['features'];

  //print(_data);
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Quake App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _features.length,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            itemBuilder: (BuildContext context, int position){
              if(position.isEven) return new Divider();

            final index = position ~/ 2; //by dividing the position by 2 to get the correct order
              var format = new DateFormat.yMMMd("en_US");
              var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['time'] * 1000
              , isUtc: true));

              return new ListTile(
                title: new Text("At : $date" ,
                style: new TextStyle(
                  fontSize: 15.4,
                ),
                ),
                subtitle: new Text("${_features[index]['properties']['place']}",
                style: new TextStyle(
                  fontSize: 13.4,
                  fontStyle: FontStyle.italic,
                ),
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: new Text("${_features[index]['properties']['mag']}",
                  style: new TextStyle(
                    fontSize: 14.4,
                  ),
                  ),
                ),
                onTap: () => _showMessage(context, "Type : " + "${_features[index]['properties']['type']}" +
                            "\n" + "Title : " + "${_features[index]['properties']['title']}")
              );

            }
        ),
      ),
    ),
  ));
}

void _showMessage(BuildContext context, String msg){
  var alert = new AlertDialog(
    title: new Text("Details"),
    content: new Text(msg),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);},
          child: new Text("OK"),
      ),
    ],
  );
  showDialog(context: context, child: alert);
}

Future<Map> getQuakes() async{
  //Resources...
  //Earthquake site - https://earthquake.usgs.gov/
  //api - view-source:https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson
  String apiURL = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(apiURL);
  return json.decode(response.body);

}