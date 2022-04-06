import 'package:flutter/material.dart';
import 'stateful.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(viewName: 'A'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.viewName}) : super(key: key);

  final String viewName;

  @override
  _MyHomePageState createState() => new _MyHomePageState(viewName: viewName);
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  String viewName;

  _MyHomePageState({Key key, this.viewName});

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = <Tab>[
      new Tab(icon: new Icon(Icons.home), text: 'Tab 1'),
      new Tab(icon: new Icon(Icons.account_box), text: 'Tab 2')
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(viewName),
      ),
      body: new TabBarView(controller: controller, children: <Widget>[
        new StatefulTab(viewName: viewName),
        new Center(child: new Text('This is the Tab 2 for view $viewName'))
      ]),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(controller: controller, tabs: tabs),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 50.0),
            ),
            new ClipRect(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text('Tap to load view: A'),
                    onTap: () => _loadView('A', context),
                  ),
                  new ListTile(
                    title: new Text('Tap to load view: B'),
                    onTap: () => _loadView('B', context),
                  ),
                  new ListTile(
                    title: new Text('Tap to load view: C'),
                    onTap: () => _loadView('C', context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadView(String view, BuildContext context) {
    Navigator.of(context).pop();
    setState(() {
      if (view == 'A') {
        viewName = 'A';
      } else if (view == 'B') {
        viewName = 'B';
      } else if (view == 'C') {
        viewName = 'C';
      }
    });
  }
}
