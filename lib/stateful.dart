import 'package:flutter/material.dart';

class StatefulTab extends StatefulWidget {
  String viewName;

  StatefulTab({Key key, this.viewName}) : super(key: key);

  @override
  StatefulTabState createState() => new StatefulTabState(viewName: viewName);
}

class StatefulTabState extends State<StatefulTab> {
  String viewName;

  StatefulTabState({Key key, this.viewName});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('This is the Tab 1 for View $viewName'),
    );
  }
}
