import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _moneyCounter = 0;
  void _rainMoney(){
    setState(() {
      _moneyCounter = _moneyCounter + 100 ;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: new Text('MakeItRain'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightGreen,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Get Much!',
            style: TextStyle(
              fontSize: 19.9,
              color: Colors.grey.shade300,

            ),
          ),
          new Expanded(
              child: Center(
                child: new Text(
                  '\$$_moneyCounter',
                  style: new TextStyle(
                    fontSize: 29.9,
                    color: _moneyCounter > 2000 ? Colors.indigoAccent : Colors.black,
                  ),
                ),
              ) ,

          ),
          new Expanded(child: new Center(
            child: new FlatButton(
                onPressed: (){
                  return _rainMoney();
                },
                color: Colors.greenAccent,
                textColor: Colors.white,
                child: Text('Let It Rain!',
            style: TextStyle(color: Colors.white70),)
            ),
          ),
          ),

        ],
      ),
    );
  }
}
