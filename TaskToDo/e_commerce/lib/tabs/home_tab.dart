import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/product_page.dart';
import 'package:e_commerce/widgets/custom_action_bar.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
class HomeTab extends StatelessWidget {
  final CollectionReference _productsRef = FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<QuerySnapshot>(
          future: _productsRef.get(),
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
        Container(
          child: CustomActionBar(
            title: 'Home',
            hasBackArrow: false,
          ),
        )
      ],
    );
  }
}
