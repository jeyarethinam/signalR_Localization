import 'package:flutter/material.dart';
import 'package:research_and_development_ondemand/showSearch/searchDelegate.dart';

class ShowSearchFLutter extends StatefulWidget {
  ShowSearchFLutter({Key key}) : super(key: key);

  @override
  _ShowSearchFLutterState createState() => _ShowSearchFLutterState();
}

class _ShowSearchFLutterState extends State<ShowSearchFLutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Show Search"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomerDelegate(),
                );
              },
            )
          ],
        ),
        body: Center(
          child: Text("Hello Wolrd"),
        ));
  }
}
