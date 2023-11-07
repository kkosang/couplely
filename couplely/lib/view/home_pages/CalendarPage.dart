import 'package:couplely/view/home_pages/BottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {},
      ),
      body: Stack(children: [
        Positioned(
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade800,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '11',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
                      Text(
                        '2023',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey.shade800,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.7,
                  decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2023, 11, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: DateTime.now(),
                      headerVisible: false,
                      calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                          defaultTextStyle: TextStyle(fontSize: 20),
                          weekendTextStyle: TextStyle(fontSize: 20),
                          todayDecoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black, width: 1.5)),
                          todayTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 22)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        MyBottomSheet(),
      ]),
    );
  }
}
