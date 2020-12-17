import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../util/utils.dart' as util;
import 'dart:async';

class Klamatic extends StatefulWidget {
  @override
  _KlamaticState createState() => _KlamaticState();
}

class _KlamaticState extends State<Klamatic> {
   String _enteredCity;

  Future _searchData(BuildContext context) async {
    Map result = await Navigator.of(context)
        .push(new MaterialPageRoute<Map>(builder: (BuildContext context) {
      return new changeCity();
    }));
    if (result != null && result.containsKey("enter")) {
      _enteredCity = result['enter'];
     // debugPrint("$_enteredCity");
    }
  }

//  void showData() async {
//    Map data = await getWeatherData(util.appID, util.defaultCity);
//    print(data.toString());
//    //print("Hey");
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Klamatic App"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () {
                  _searchData(context);
                 print(_enteredCity);
                }),
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/umbrella.png',
              height: 1000.0,
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 10.0, 16.0, 0),
            alignment: Alignment.topRight,
            child: new Text(
              "${_enteredCity == null ? util.defaultCity : _enteredCity}",
              style: cityTextStyle(),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset(
              'images/light_rain.png',
              width: 100.0,
              height: 100.0,
            ),
          ),
          updateTempWidget(_enteredCity)
        ],
      ),
    );
  }

  TextStyle cityTextStyle() {
    return new TextStyle(
      color: Colors.white,
      fontSize: 20.4,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle tempStyle() {
    return new TextStyle(
      color: Colors.white,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle extraDataStyle() {
    return new TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 15.0,
    );
  }

  Future<Map> getWeatherData(String appID, String city) async {
    String apiURl =
        "http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=${util.appID}&units=imperial";
    http.Response response = await http.get(apiURl);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
        future:
            getWeatherData(util.appID, city == null ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              margin: const EdgeInsets.fromLTRB(30.0, 310.0, 0.0, 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      "${content['main']['temp'].toString()}" + " F",
                      style: new TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30.9,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    ),
                    subtitle: new Text(
                        "Humidity : " +
                            "${content['main']['humidity'].toString()} "+ "\n" +
                            "Min : " +
                            "${content['main']['temp_min'].toString()}" + " F\n" +
                            "Max : " +
                            "${content['main']['temp_max'].toString()}" + " F",
                        style: extraDataStyle()),
                  ),
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}

class changeCity extends StatelessWidget {
  var _textFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Change City"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              'images/white_snow.png',
              width: 500.0,
              height: 1000.0,
              fit: BoxFit.fill,
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  controller: _textFieldController,
                  decoration: new InputDecoration(labelText: 'Enter a city'),
                  keyboardType: TextInputType.text,
                ),
              ),
              new ListTile(
                title: new RaisedButton(
                    child: new Text("Get Weather Data"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      //print(_textFieldController.text);
                        Navigator.pop(
                            context, {'enter': _textFieldController.text});
                    }),
              ),
            ],

          ),

        ],
      ),
    );
  }
}
