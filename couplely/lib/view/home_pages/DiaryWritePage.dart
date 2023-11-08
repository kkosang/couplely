import 'package:flutter/material.dart';

class DiaryWritePage extends StatefulWidget {
  const DiaryWritePage({super.key});

  @override
  State<DiaryWritePage> createState() => _DiaryWritePageState();
}

class _DiaryWritePageState extends State<DiaryWritePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade800,
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            color: Colors.grey.shade800,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '완료',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
          Container(
            width: screenSize.width * 0.9,
            height: screenSize.width * 0.9,
            child: TextButton(
              onPressed: () {},
              child: Container(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(115.0),
                  child: Text('사진을 넣어주세요',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '내용을 입력해 주세요'
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
