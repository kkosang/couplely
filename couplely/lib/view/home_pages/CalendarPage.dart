
import 'dart:ui';

import 'package:couplely/view/home_pages/BottomSheet.dart';
import 'package:couplely/view/home_pages/DiaryWritePage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  bool floatingEnable = false;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: <Widget>[
          floatingEnable
              ? Align(
                  alignment: Alignment(
                      Alignment.bottomRight.x, Alignment.bottomRight.y - 0.4),
                  child: FloatingActionButton(
                    onPressed: () {},
                    tooltip: '일정',
                    child: Icon(Icons.fact_check_outlined),
                  ))
              : Container(),
          floatingEnable
              ? Align(
                  alignment: Alignment(
                      Alignment.bottomRight.x, Alignment.bottomRight.y - 0.2),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiaryWritePage()),
                      );
                    },
                    tooltip: '다이어리',
                    child: Icon(Icons.book),
                  ))
              : Container(),
          Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    floatingEnable = !floatingEnable;
                  });
                },
                tooltip: '추가',
                child: Icon(Icons.add),
              )),
        ],
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
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2023, 11, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: focusedDay,
                      onDaySelected:
                          (DateTime selectedDay, DateTime focusedDay) {
                        // 선택된 날짜의 상태를 갱신합니다.
                        setState(() {
                          this.selectedDay = selectedDay;
                          this.focusedDay = focusedDay;
                        });
                      },
                      selectedDayPredicate: (DateTime day) {
                        // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                        return isSameDay(selectedDay, day);
                      },
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
