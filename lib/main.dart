import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main(List<String> args) {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Quote _currentQuote = new Quote("", "");

  _generateQuote() {
    http.get('http://toybox.royalthomas.me/SiliconValley/').then((response) {
      var finalResponse = json.decode(response.body);
      setState(() {
        _currentQuote =
            new Quote(finalResponse['quote'], finalResponse['name']);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateQuote();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.refresh),
          onPressed: () => _generateQuote(),
        ),
        appBar: new AppBar(
          backgroundColor: Colors.green,
          title: new Text('Silicon Valley Quote Generator'),
        ),
        body: Center(
          child: new Card(
            margin: new EdgeInsets.all(6.0),
            elevation: 1.0,
            
            child: new Container(
              padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: new ListTile(
              
              title: new Text(_currentQuote.getQuote()),
              subtitle: new Text(_currentQuote.getAuthor()),
            ),
            )
          ),
        ),
      ),
    );
  }
}

class Quote {
  String _quote, _author;

  String getQuote() {
    return _quote;
  }

  String getAuthor() {
    return _author;
  }

  Quote(this._quote, this._author);
}
