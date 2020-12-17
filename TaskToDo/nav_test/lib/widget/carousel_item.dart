import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselItemPage extends StatelessWidget {
  final String imgPath;
  final Function onTap;

  const CarouselItemPage({
    @required this.imgPath,
    @required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.fill,
            )
          ),
      ),
    );
  }


}
