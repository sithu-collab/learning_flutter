import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*
  source => https://www.livescience.com/33356-weight-on-planets-mars-moon.html
  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06
  weight = mass * multiplier (surface gravity)
  */
  final TextEditingController _weightController = new TextEditingController();
  String _formattedText = "";
  int radioValue = 0;
  double _finalResult = 0.0;
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = 'Your weight on Mars is ${_finalResult.toStringAsFixed(1)}';
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = 'Your weight on Venus is ${_finalResult.toStringAsFixed(1)}';
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = 'Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}';
          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black38,
        centerTitle: true,
        elevation: 0,
        title: new Text('Weight On Planet X'),
      ),
      backgroundColor: Colors.indigo,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/planet.jpg'),
                      radius: 30.0,
                    ),
                  ),
                ),
              ),
              new Container(
                margin: const EdgeInsets.all(5.0),
                child: new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Your weight on earth',
                    hintText: 'In pounds',
                    icon: Icon(
                      Icons.person,
                    color: Colors.grey.shade500,
                    ),
                  ),
                ),

              ),
              new Container(
                padding: const EdgeInsets.all(3.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio<int>(
                        activeColor: Colors.red,
                        value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                    new Text(
                      'Mars',style: TextStyle(color: Colors.white70),
                    ),
                    new Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                    new Text(
                      'Venus',style: TextStyle(color: Colors.white70),
                    ),
                    new Radio<int>(
                        activeColor: Colors.brown,
                         value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                    new Text(
                      'Pluto',style: TextStyle(color: Colors.white70),
                    ),

                  ],
                ),
              ),

              new Container(
                padding: const EdgeInsets.all(15.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      _weightController.text.isEmpty ? 'Please enter your weight' : _formattedText + 'lbs',

                     // '$_formattedText lbs',
                      style: TextStyle(
                        fontSize: 19.9,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
              )

            ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    }else{
      print('Wrong');
      return int.parse('180') * 0.38;
    }
  }
}
