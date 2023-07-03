import 'package:flutter/material.dart';
import 'package:persistent_tab_bars/page1.dart';
import 'package:persistent_tab_bars/page2.dart';
import 'package:persistent_tab_bars/page3.dart';

class MainPersistentTabBar extends StatelessWidget {
  const MainPersistentTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
                text: "Tab 1",
              ),
              Tab(icon: Icon(Icons.directions_transit), text: "KeepAlive"),
                            Tab(icon: Icon(Icons.directions_transit), text: "Tab 3"),
            ],
          ),
          title: const Text('Persistent Tab Demo'),
        ),
        body: const TabBarView(
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
      ),
    );
  }
}
