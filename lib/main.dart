import 'dart:async';
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

  Future<http.Response> _generateQuote() {
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
          title: new Text('Silicon Valley Quote Generator'),
        ),
        body: new Center(
          child: new ListTile(
            title: new Text(_currentQuote.getQuote()),
            subtitle: new Text(_currentQuote.getAuthor()),
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
