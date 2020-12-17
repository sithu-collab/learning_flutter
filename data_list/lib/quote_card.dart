import 'package:flutter/material.dart';
import 'quote.dart';

Card QuoteCard(quote, {Null Function() delete}) {
  return Card(
    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            quote.text,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[700],

            ),
          ),
          SizedBox(height: 6.0),
          Text(
            quote.author,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[500],

            ),
          ),
          SizedBox(height: 8.0),
          FlatButton.icon(
            onPressed: delete,
            label: Text('delete quote'),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    ),
  );
}