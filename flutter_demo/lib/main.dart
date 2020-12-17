import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: SpiderCard(),
  debugShowCheckedModeBanner: false,
));

int _spiderLevel = 0;
class SpiderCard extends StatefulWidget {
  @override
  _SpiderCardState createState() => _SpiderCardState();
}

class _SpiderCardState extends State<SpiderCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('SpiderCard'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _spiderLevel += 1 ;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0,40.0,30.0,0.0),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/image3.jpg'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 90.0,
              color: Colors.grey[600],
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Spider',
              style: TextStyle(
                color: Colors.amber[600],
                fontSize: 20.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30.0),

            Text(
              'Current Spider Level',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '$_spiderLevel',
              style: TextStyle(
                color: Colors.amber[600],
                fontSize: 20.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30.0),

            Text(
              'Company Name',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 15.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Eternal Software House',
              style: TextStyle(
                color: Colors.amber[600],
                fontSize: 20.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30.0),

            Row(
              children: <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.grey[500],
                ),
                SizedBox(width: 10.0),
                Text(
                  'spider@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15.0,
                    letterSpacing: 1.0,

                  ),


                )
              ],
            )

          ],
        ),
      )
    );

  }
}






