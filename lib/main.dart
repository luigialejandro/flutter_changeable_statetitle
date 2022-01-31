import "package:flutter/material.dart";

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    new MyTabs(title: "Green", color: Colors.green),
    new MyTabs(title: "Red", color: Colors.red[200])
  ];
  late MyTabs _myHandler;
  late TabController _controller;
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_myHandler.title, style: TextStyle(fontSize: 18)),
        backgroundColor: _myHandler.color,
        bottom: new TabBar(
          controller: _controller,
          tabs: <Tab>[
            new Tab(
              text: _tabs[0].title,
            ),
            new Tab(
              text: _tabs[1].title,
            )
          ],
        ),
      ),
    );
  }
}

class MyTabs {
  final String title;
  final Color? color;
  MyTabs({this.title = '', this.color});
}
