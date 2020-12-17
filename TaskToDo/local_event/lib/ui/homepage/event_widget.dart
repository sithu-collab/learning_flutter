import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_event/model/event.dart';
import 'package:local_event/styleGuide.dart';
class EventWidget extends StatelessWidget {
  final Event event;

  EventWidget({this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 20.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0,  bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 130.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: Image.asset(event.imgPath, fit: BoxFit.fitWidth,)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title, style: eventTitleTextStyle.copyWith(
                          color: Colors.black
                        ),),
                        SizedBox(height: 10.0,),
                        FittedBox(
                          child: Row(
                            children: [
                              Icon(Icons.location_on,),
                              SizedBox(width: 8.0,),
                              Text(event.location)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration.toUpperCase(),
                      textAlign: TextAlign.right,
                      style: eventLocationTextStyle.copyWith(fontWeight: FontWeight.w800),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
