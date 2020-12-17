import 'package:flutter/material.dart';
import 'package:local_event/model/event.dart';
import 'package:local_event/model/guests.dart';
import 'package:local_event/styleGuide.dart';
import 'package:provider/provider.dart';
class EventDetailsContent extends StatelessWidget {
  final Event event;

  EventDetailsContent({this.event});

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 36.0,),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
              child: Text(
                event.title,
                style: eventWhiteTitleTextStyle,)
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: FittedBox(
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 22.0,),
                  Text(event.location, style: eventLocationTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0
                  ),)
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.09,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text('GUESTS', style: guestTextStyle)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(final guest in guests)
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(guest.imgPath, fit: BoxFit.fill,)),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: event.punchLine1, style: punchLine1TextStyle),
                  TextSpan(text: event.punchLine2, style: punchLine2TextStyle),
                ]
              )
            ),
          ),
          if (event.description.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(event.description, style: eventLocationTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: FontWeight.w400
              ),),
            ),
          SizedBox(height: 20.0,),
          if (event.galleryImages.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
                child: Text('GALLERY', style: guestTextStyle,)),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(final galleryImagesPath in event.galleryImages)
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        galleryImagesPath,
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}





