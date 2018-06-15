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
        ),
        appBar: new AppBar(
          title: new Text('Silicon Valley Quote Generator'),
        ),
        body: new Center(
          child: new ListTile(
            title: new Text("Hello"),
            subtitle: new Text("World"),
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
