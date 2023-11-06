import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              height: MediaQuery.of(context).size.height * 1 / 9,
            ),
            Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 1 / 20,
                    width: MediaQuery.of(context).size.width * 1 / 2,
                    decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 10),
                      child: Text(
                        "2023. 11. 06 MON",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              child: Container(
                height: MediaQuery.of(context).size.height * 1 / 9,
                decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70))),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orange.shade50, Colors.white],
                      stops: [0, 1])),
            ),
          ],
        ),
      ),
      Positioned(
        left: MediaQuery.of(context).size.width * 1 / 10,
        top: MediaQuery.of(context).size.height * 3 / 10,
        right: MediaQuery.of(context).size.width * 1 / 10,
        bottom: MediaQuery.of(context).size.height * 1 / 10,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(300))),
          child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(300)),
              child: Image.network(
                'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F996A953A5A4335EA24',
                fit: BoxFit.cover,
              )),
        ),
      ),
      Positioned(
        left: MediaQuery.of(context).size.width * 1 / 15,
        top: MediaQuery.of(context).size.height * 1 / 5,
        bottom: MediaQuery.of(context).size.height * 3 / 5,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.yellow[50],
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(200))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.favorite,
                  size: 70,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text('홍길동 님과 홍길동 님,'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('만난 지'),
                        Text(
                          ' 324 ',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text('일째'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
