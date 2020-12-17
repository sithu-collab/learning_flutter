import 'package:flutter/material.dart';

import '../menu_dashboard_layout.dart';

class Dashboard extends StatelessWidget {
  final bool isCollapsed;
  final Duration duration;
  final double screenWidth;
  final Animation<double> scaleAnimation;
  final Function onMenuTap;


  const Dashboard({
    @required this.isCollapsed,
    @required this.duration,
    @required this.screenWidth,
    @required this.scaleAnimation,
    @required this.onMenuTap
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.3 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: onMenuTap,
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 25.0,
                          )),
                      Text(
                        'My Cards',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 200.0,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        pageSnapping: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 100.0,
                            color: Colors.red,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Container(
                            width: 100.0,
                            color: Colors.amber,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                          Container(
                            width: 100.0,
                            color: Colors.purple,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ],
                      ),
                    ),

                  SizedBox(height: 10.0,),
                  Text('Transitions', style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  SizedBox(height: 5.0,),
                  ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    primary: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                            _itemList(title: 'Macbook', subTitle: 'Apple', icon: Icons.computer),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _itemList({String title, String subTitle, IconData icon}) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Icon(icon),
      ),
    );
  }
}
