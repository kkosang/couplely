import 'package:couplely/view/home_pages/CalendarPage.dart';
import 'package:couplely/view/home_pages/FirstPage.dart';
import 'package:couplely/view/home_pages/SummaryPage.dart';
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
              FirstPage(),
              CalendarPage(),
              SummaryPage(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.circle_outlined,
                  color: Colors.red.shade200,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.calendar_month,
                  color: Colors.red.shade200,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.menu_rounded,
                  color: Colors.red.shade200,
                  size: 40,
                ),
              ),
            ],
          ),
        ));
  }
}
