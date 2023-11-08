import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Scroller.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  late double _height = 0;
  late double _lowLimit;
  late double _highLimit;
  late double _upThresh;
  late double _boundary;
  late double _downThresh;

  /// 100 -> 600, 550 -> 100 으로 애니메이션이 진행 될 때,
  /// 드래그로 인한 _height의 변화 방지
  bool _longAnimation = false;
  bool _appBarState = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _highLimit = size.height * 0.42;
    _downThresh = size.height * 0.35;
    _lowLimit = size.height * 0.1;
    _upThresh = size.height * 0.11;
    _boundary = size.height * 0.32;
    return Positioned(
        bottom: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: GestureDetector(
              onVerticalDragUpdate: ((details) {
                // delta: y축의 변화량, 우리가 보기에 위로 움직이면 양의 값, 아래로 움직이면 음의 값
                double? delta = details.primaryDelta;
                if (delta != null) {
                  /// Long Animation이 진행 되고 있을 때는 드래그로 높이 변화 방지,
                  /// 그리고 low limit 보다 작을 때 delta가 양수,
                  /// High limit 보다 크거나 같을 때 delta가 음수이면 드래그로 높이 변화 방지
                  if (_longAnimation ||
                      (_height <= _lowLimit && delta > 0) ||
                      (_height >= _highLimit && delta < 0)) return;
                  setState(() {
                    /// 맨 위로 높이 설정
                    if (_upThresh <= _height && _height <= _boundary) {
                      _height = _highLimit;
                      _longAnimation = true;
                      _appBarState = true;
                      context.read<Scroller>().up();
                    }

                    /// 처음 위치로 높이 설정
                    else if (_boundary <= _height && _height <= _downThresh) {
                      _height = _lowLimit;
                      _longAnimation = true;
                      _appBarState = false;
                      Future.delayed(const Duration(milliseconds: 600), () {
                        context.read<Scroller>().down();
                      });
                    }

                    /// 기본 작동
                    else {
                      _height -= delta;
                    }
                  });
                }
              }),
              child: AnimatedContainer(
                curve: Curves.linear,
                onEnd: () {
                  if (_longAnimation) {
                    setState(() {
                      _longAnimation = false;
                    });
                  }
                },
                duration: const Duration(milliseconds: 200),
                width: MediaQuery.of(context).size.width,
                height: _height == 0 ? _lowLimit : _height,
                child: Scaffold(
                    body: CustomScrollView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      elevation: 0,
                      title: Container(
                        width: size.width * 0.3,
                        height: 4.5,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    SliverFillRemaining(
                        child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        width: size.width,
                        height: size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('   오늘 할 일'),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: size.width * 0.7,
                                height: 3,
                                decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                  5,
                                  (index) => Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.circle_rounded,size: 20,color: Colors.grey,),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('저녁 약속',style: TextStyle(fontSize: 20),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('17:30 ~ 19:00',style: TextStyle(color: Colors.grey),),
                                          ),
                                        ],
                                      )),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                )),
              )),
        ));
  }
}
