import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/product_page.dart';
import 'package:e_commerce/services/firebase_services.dart';
import 'package:e_commerce/widgets/custom_action_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.userRef.doc(_firebaseServices.getUserId()).collection('Cart').get(),
            builder: (context, snapshot) {
              //if snapshot has error
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              }

              // Collection data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView(
                  padding: EdgeInsets.only(top: 70.0, bottom: 10.0),
                  children: snapshot.data.docs.map((document) {
                    return FutureBuilder(
                      future: _firebaseServices.productRef.doc(document.id).get(),
                      builder: (context, productSnapshot) {
                        // if productSnapshot has error
                        if (productSnapshot.hasError) {
                          return Container(
                            child: Center(
                                child: Text('Error: ${productSnapshot.error}')
                            ),
                          );
                        }

                        // if productSnapshot done
                        if (productSnapshot.connectionState == ConnectionState.done) {
                          Map _productMap = productSnapshot.data.data();
                          return Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 6.0, top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 100.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.network('${_productMap['images'][0]}', fit: BoxFit.cover,))
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${_productMap['name']}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15.0),),
                                    Text('\$${_productMap['price']}', style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w600),),
                                    Text("size - ${document.data()['size']}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 13.0),),
                                  ],
                                )
                              ],
                            ),
                          );
                        }

                        // loading state
                        return Center(
                            child: CircularProgressIndicator()
                        );
                      },
                    );
                  }).toList(),
                );
              }

              // loading state
              return Center(child: CircularProgressIndicator(),);
            },
          ),
          CustomActionBar(
            title: 'Cart',
            hasBackground: false,
            hasBackArrow: true,
          )
        ],

      )
    );
  }
}
