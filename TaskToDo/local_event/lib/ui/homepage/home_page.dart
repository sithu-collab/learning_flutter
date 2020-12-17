import 'package:flutter/material.dart';
import 'package:local_event/app_state.dart';
import 'package:local_event/model/category.dart';
import 'package:local_event/model/event.dart';
import 'package:local_event/styleGuide.dart';
import 'package:local_event/ui/detail_pages/event_detail.dart';
import 'package:local_event/ui/homepage/category_widget.dart';
import 'package:local_event/ui/homepage/event_widget.dart';
import 'package:provider/provider.dart';

import 'home_page_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: [
            HomePageBackground(screenHeight: screenHeight),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('LOCAL EVENTS', style: fadedTextStyle,),
                          Icon(
                            Icons.person_outline,
                            size: 23.0,
                            color: Color(0x99FFFFFF),)
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                        child: Text("What's Up", style: whiteHeadingTextStyle,)),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 10.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for(final category in categories)
                                CategoryWidget(category: category,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0, bottom: 10.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => SingleChildScrollView(
                          child: Column(
                            children: [
                              for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId)))
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => EventDetailsPage(event: event,)
                                      ));
                                    },
                                    child: EventWidget(event: event,)),
                            ],
                          ),
                        ),
                      ),
                    )

                  ],
                ),

              ),

            ),
          ],
        ),
      ),
    );
  }
}
