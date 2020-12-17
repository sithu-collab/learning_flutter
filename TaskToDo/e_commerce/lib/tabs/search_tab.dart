import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/services/firebase_services.dart';
import 'package:e_commerce/widgets/custom_inputField.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FirebaseServices _firebaseServices = FirebaseServices();
  String _searchString = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if (_searchString.isEmpty)
            Center(child: Text('Search Results...', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)))
          else
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.productRef.orderBy('search_string')
                .startAt([_searchString])
                .endAt(["$_searchString\uf8ff"])
                .get(),
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
          Container(
            padding: EdgeInsets.only(top: 36.0, left: 8.0, right: 8.0),
            child: CustomInputField(
              icon: Icon(Icons.search, color: Theme.of(context).accentColor,),
              hintText: 'Search what you need...',
              onSubmitted: (value) {
                  setState(() {
                    _searchString = value.toLowerCase();
                  });
              },
            ),
          ),
        ],
      ),
    );
  }
}
