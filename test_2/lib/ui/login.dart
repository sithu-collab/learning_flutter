import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _username = "";
  void _clear(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _welcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        _username = _userController.text;
      }else{
        _username = "Nothig to show";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: new Text('Login'),
        centerTitle: true,

      ),
      backgroundColor: Colors.blueGrey,

      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
           new Center(
             child: new Container(
               margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
               width: 150,
               height: 150,
               child: CircleAvatar(
                 backgroundImage: AssetImage('images/image_2.jpg'),
                 radius: 20.0,
               ),
             ),
           ),
           new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'username',
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey.shade500,
                      ),
                    ),

                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: 'password',
                      icon: Icon(
                        Icons.lock,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    obscureText: true,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 33.0),
                        child: new Row(
                          children: <Widget>[
                        new RaisedButton(
                            color: Colors.redAccent,
                                onPressed: _welcome,
                              child: new Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),

                            ),
                        new Container(
                              margin: const EdgeInsets.only(left: 120.0),
                              child: new RaisedButton(
                                color: Colors.redAccent,
                                onPressed: _clear,
                              child: new Text(
                                'Clear',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),

            ),
            new Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'Welcome $_username',
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,

                      ),
                    )
                  ],
                ),
              ),
            )
          ],


        ),
      ),
    );
  }
}
