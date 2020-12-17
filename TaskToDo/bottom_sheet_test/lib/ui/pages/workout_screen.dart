import 'package:bottom_sheet_test/model/upper_body_workout.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text(
                  'Date, Year',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Upper Body',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '60 mins',
                          style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.terrain,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Easy',
                          style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              for (int i = 0; i < upperBodyWorkout.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int j = 0; j < upperBodyWorkout[i].length; j++)
                      ListTile(
                        leading: Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              shape:
                                  BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage(upperBodyWorkout[i][j].imgPath),
                                  fit: BoxFit.cover)),
                        ),
                        title: Text(upperBodyWorkout[i][j].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          upperBodyWorkout[i][j].instructions,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    SizedBox(height: 20.0,),
                  ],
                )
            ],
          ),
        ),
      ),
//    body: Center(child: Text('Hello World', style: TextStyle(color: Colors.white),),),
    );
  }
}
