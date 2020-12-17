import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {
  final List imageList;

  ImageSwipe({this.imageList});

  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 265.0,
          child: PageView(
            onPageChanged: (num) {
              setState(() {
                _currentIndex = num;
              });
            },
            children: [
              for(var i = 0; i < widget.imageList.length; i++)
                Container(
                  child: Image.network("${widget.imageList[i]}",
                    fit: BoxFit.cover,),
                ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(var j = 0; j < widget.imageList.length; j++)
                AnimatedContainer(
                  duration: Duration(
                    milliseconds: 300
                  ),
                  curve: Curves.easeIn,
                  margin: EdgeInsets.only(left: 6.0),
                  height: 8.0,
                  width: _currentIndex == j ? 22.0 : 10.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
