import 'package:e_commerce/screens/product_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
class ProductCard extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String imgUrl;
  final String name;
  final String price;

  ProductCard({this.onPressed, this.imgUrl, this.name, this.price, this.productId});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0
        ),
        height: 270.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductPage(productId: productId,)
                ));
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                height: 240.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name ?? 'Product Name', style: Constants.regularHeading,),
                    Text(price ?? 'Price', style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
