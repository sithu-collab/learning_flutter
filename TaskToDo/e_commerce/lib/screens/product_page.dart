import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/services/firebase_services.dart';
import 'package:e_commerce/widgets/custom_action_bar.dart';
import 'package:e_commerce/widgets/image_swipe.dart';
import 'package:e_commerce/widgets/product_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  final String productId;

  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices = FirebaseServices();


  // Flow of collection => Users -> UserId (document) -> Cart -> CartId (document) -> Size
  Future _addToCart() {
    return _firebaseServices.userRef
        .doc(_firebaseServices.getUserId())
        .collection('Cart')
        .doc(widget.productId)
        .set({"size" : _selectedProductSize});
  }

  Future _savedToList() {
      return _firebaseServices.productRef.doc(widget.productId).get();
  }

  final _addToCartSnackBar = SnackBar(content: Text('Product added to the cart',));
  final _savedSnackBar = SnackBar(content: Text('Product saved to your list'));

  String _selectedProductSize = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.productRef.doc(widget.productId).get(),
            builder: (context, snapshot) {
              // if snapshot has error
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              }

              // Collection data ready to display
              if (snapshot.connectionState == ConnectionState.done) {

                // Firebase document data Map
                Map<String, dynamic> documentData = snapshot.data.data();

                // List of images
                List imageList = documentData['images'];
                // List of productSizes
                List _productSizes = documentData['size'];
                // Set the initial productSize
                _selectedProductSize = _productSizes[0];

                return ListView(
                  padding: EdgeInsets.all(0.0),
                  children: [
                    ImageSwipe(imageList: imageList,),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0,),

                          //Product Name
                          Text("${documentData['name']}", style: Constants.boldHeading,),
                          SizedBox(height: 8.0,),

                          // Product Price part
                          Text("\$${documentData['price']}", style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600
                          )),
                          SizedBox(height: 10.0,),

                          // Product description part
                          Text("${documentData['desc']}",style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14.0,
                          )),

                          SizedBox(height: 10.0,),

                          // ProductSize part
                          Text('Select Size', style: Constants.regularHeading),
                          SizedBox(height: 10.0,),

                          // ProductSize  Selection part
                          ProductSize(
                            productSize: _productSizes,
                            onSelected: (size) {
                              _selectedProductSize = size;
                            },
                          ),
                          SizedBox(height: 10.0,),

                          // Add to Cart part
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 12.0,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDCDCDC),
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.bookmark_border),
                                      onPressed: () async{
                                        await _savedToList();
                                        Scaffold.of(context).showSnackBar(_savedSnackBar);
                                      },),
                                ),
                                SizedBox(width: 10.0,),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async{
                                      await _addToCart();
                                      Scaffold.of(context).showSnackBar(_addToCartSnackBar);
                                    },
                                    child: Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Add to Cart',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                       ],
                      ),
                    )

                  ],
                );
              }

              // loading state
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          CustomActionBar(
            hasBackground: false,
            hasTitle: false,
            hasBackArrow: true,
          )
        ],
      ),
    );
  }
}
