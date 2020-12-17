import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/services/firebase_services.dart';
import 'package:e_commerce/widgets/custom_action_bar.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
class SavedTab extends StatefulWidget {
  final String productId;

  SavedTab({this.productId});

  @override
  _SavedTabState createState() => _SavedTabState();
}

class _SavedTabState extends State<SavedTab> {
  FirebaseServices _firebaseServices = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
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
                  padding: EdgeInsets.only(top: 88.0, bottom: 10.0),
                  children: snapshot.data.docs.map((document) {
                    return ProductCard(
                      productId: document.id,
                      price: "\$${document.data()['price']}",
                      name: document.data()['name'],
                      imgUrl: document.data()['images'][0],
                    );
                  }).toList(),
                );
              }
              // loading state
              return Center(child: CircularProgressIndicator(),);
            },
          ),
          CustomActionBar(
           hasBackground: true,
           title: 'Saved Products',
          ),
        ],
      )
    );
  }
}
