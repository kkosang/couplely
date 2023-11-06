import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(

            children: [
              Container(),
              Container(),
              Container(),
            ],
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.circle_outlined),
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
              ),
              Tab(
                icon: Icon(Icons.menu_rounded),
              ),
            ],
          ),
        ));
  }
}
