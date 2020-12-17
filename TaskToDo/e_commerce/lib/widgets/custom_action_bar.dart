import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/cart_page.dart';
import 'package:e_commerce/services/firebase_services.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatefulWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;

  CustomActionBar(
      {this.title, this.hasBackArrow, this.hasTitle, this.hasBackground});

  @override
  _CustomActionBarState createState() => _CustomActionBarState();
}

class _CustomActionBarState extends State<CustomActionBar> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    bool _hasTitle = widget.hasTitle ?? true;
    bool _hasBackArrow = widget.hasBackArrow ?? false;
    bool _hasBackground = widget.hasBackground ?? true;
    int _totalItems = 0;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(
                  colors: [Colors.white, Colors.white.withOpacity(0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                )
              : null),
      padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_hasBackArrow)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 22.0,
                    )),
                  ),
                ),
              if (_hasTitle)
                Text(
                  widget.title ?? 'Action Bar',
                  style: Constants.boldHeading,
                ),
              Stack(children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                ),
                Positioned(
                  left: 6.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => CartPage()));
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                    right: 1.0,
                    top: -2.0,
                    child: Container(
                        height: 20.0,
                        width: 16.0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            shape: BoxShape.circle),
                        child: StreamBuilder(
                          stream: _firebaseServices.userRef
                              .doc(_firebaseServices.getUserId())
                              .collection('Cart')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              List _documents = snapshot.data.docs;
                              _totalItems = _documents.length;
                            }
                            return Center(
                                child: Text(
                              "$_totalItems" ?? '0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600),
                            ));
                          },
                        ))),
              ])
            ],
          )),
    );
  }
}
