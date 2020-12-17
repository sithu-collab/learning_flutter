import 'package:flutter/material.dart';
import 'package:local_event/model/event.dart';
import 'package:local_event/ui/detail_pages/event_details_background.dart';
import 'package:local_event/ui/detail_pages/event_details_content.dart';
import 'package:provider/provider.dart';
class EventDetailsPage extends StatelessWidget {
  final Event event;

  EventDetailsPage({this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: [
            EventDetailsBackground(),
            EventDetailsContent()
          ],
        ),
      ),
    );
  }
}
