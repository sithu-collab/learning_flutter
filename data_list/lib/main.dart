import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
void main() => runApp(MaterialApp(
  home: Quotelist(),
  debugShowCheckedModeBanner: false,
));

List<Quote> quotes = [
  Quote(text: 'Be yourself, everyone else is already taken', author: 'Oscar' ),
  Quote(text:   'I have nothing to declare except my genius', author: 'Oscar'),
  Quote(text: 'Only GOD will know my code', author: 'Spider')
];

Widget quoteTemplate(quote){
  return QuoteCard(quote);
}

class Quotelist extends StatefulWidget {
  @override
  _QuotelistState createState() => _QuotelistState();
}

class _QuotelistState extends State<Quotelist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Quotelist'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,

      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: quotes.map((quote) => QuoteCard(
              quote,
            delete: (){
                setState(() {
                  quotes.remove(quote);
                });
            }
          )).toList(),

        ),
      )
    );
  }
}


