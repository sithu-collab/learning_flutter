import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:nav_test/pages/carousel_item_detail_page/InlayPage.dart';

import '../widget/carousel_item.dart';

class MainPage extends StatefulWidget {
  @override
  _SidebarHomePageState createState() => _SidebarHomePageState();
}

class _SidebarHomePageState extends State<MainPage> {
  int currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List cardList = [
      CarouselItemPage(imgPath: 'assets/images/Inlay_1.jpg', onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => InlayPage()
        ));
      },),
      CarouselItemPage(imgPath: 'assets/images/Inlay_2.jpg',),
      CarouselItemPage(imgPath: 'assets/images/Inlay_3.jpg',),
      CarouselItemPage(imgPath: 'assets/images/Inlay_4.jpg',),

    ];
    Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                      height: screenHeight * 0.25,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 500),
                      autoPlayCurve: Curves.easeIn,
                      viewportFraction: 0.9,
                      autoPlayInterval: Duration(seconds: 3),
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }
                  ),
                  items: cardList.map((card) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.3,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Card(
                            child: card,
                            shadowColor: Colors.brown,
                          ),
                        );
                      },
                    );
                  }).toList()
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index ? Colors.blueGrey : Colors
                            .grey
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
