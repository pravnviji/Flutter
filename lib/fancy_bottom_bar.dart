import 'package:NewFlutterApp/tabfancybar.dart';
import 'package:flutter/material.dart';

class FancyBottomPage extends StatefulWidget {
  @override
  _FancyBottomPageState createState() => _FancyBottomPageState();
}

class _FancyBottomPageState extends State<FancyBottomPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fancy Bottom Bar')),
      body: TabBarView(children: [
        new Text("Home View", style:TextStyle(fontSize: 18.0)),
        new Text("Search View", style:TextStyle(fontSize: 18.0)),
        new Text("User View", style:TextStyle(fontSize: 18.0)),
      ],
      controller: _tabController,),
      bottomNavigationBar: FancyTabBar(customTabController:_tabController),
    );
  }
}
