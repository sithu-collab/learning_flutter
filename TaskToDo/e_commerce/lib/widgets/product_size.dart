import 'package:flutter/material.dart';
class ProductSize extends StatefulWidget {
  final List productSize;
  final Function(String) onSelected;

  ProductSize({this.productSize, this.onSelected});

  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        for(var i = 0; i < widget.productSize.length; i++)
          GestureDetector(
            onTap: () {
              widget.onSelected("${widget.productSize[i]}");
              setState(() {
                _currentIndex = i;
              });
            },
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 300
              ),
              curve: Curves.easeIn,
              margin: EdgeInsets.only(left: 6.0),
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: _currentIndex == i ? Theme.of(context).accentColor : Color(0xFFDCDCDC),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(widget.productSize[i],
                  style: TextStyle(
                      color: _currentIndex == i ? Colors.white : Colors.black,
                  ),)),
            ),
          )
      ],
    );
  }
}
