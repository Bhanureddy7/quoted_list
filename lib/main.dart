import 'package:flutter/material.dart';
import 'Quote.dart'; // Make sure to import the Quote class from the correct location

void main() {
  runApp(MaterialApp(
    home: QuotedList(),
  ));
}

class QuotedList extends StatefulWidget {
  QuotedList({Key? key}) : super(key: key);

  @override
  _QuotedListState createState() => _QuotedListState();
}

class _QuotedListState extends State<QuotedList> {
  List<Quote> quotes = [
    Quote(author: 'bhanu', text: 'bhanu reddy'),
    Quote(author: 'bhanu', text: 'bhanu reddy'),
    Quote(author: 'bhanu', text: 'bhanu reddy'),
  ];

  Widget quoteTemplate(Quote quote) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(
        children: <Widget>[
          Text(
            quote.text ?? 'no text',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          Text(
            quote.author ?? 'no author',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 18.0),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                quotes.remove(quote);
              });
            },
            label: Text('Delete Quote'),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Center(child: Text("Awesome Quotes")),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: quotes.map((quote) {
          return quoteTemplate(quote);
        }).toList(),
      ),
    );
  }
}
