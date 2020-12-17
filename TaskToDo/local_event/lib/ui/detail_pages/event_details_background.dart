import 'package:flutter/material.dart';
import 'package:local_event/model/event.dart';
import 'package:provider/provider.dart';
class EventDetailsBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final event = Provider.of<Event>(context);
    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: ImageClipper(),
        child: Image.asset(
              event.imgPath,
              fit: BoxFit.cover,
              color: Colors.brown,
              colorBlendMode: BlendMode.darken,
              width: screenWidth,
              height: screenHeight * 0.5,
            ),

      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0,35);
    Offset curveEndPoint = Offset(size.width, size.height * 0.95);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.32, size.height * 0.85, curveEndPoint.dx, curveEndPoint.dy + 10.0);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}