import 'package:flutter/material.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
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
                        '수정',
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
            height: screenSize.height * 0.4,
            child: Image.network('https://i.namu.wiki/i/I7rS3Y4vnX0neHzRIL5S0iZ6aAZQMTgB-usPt142UZwZKGuVUDH8GnI-mNKdqUOe5MITYPik0IhB20ZJgTjFzCfoVbdKYEtrBX04xNQ7G_0I0vqA43bnWSdaf5qOIpHc7-3xTw8msU3O2EpAuwGAXw.webp')
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('오늘은 바다에 갔다. 재밌었다. 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세 남산위에 저 소나무철갑을 두른 듯 바람 서리 불변함은 우리 기상일세 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세'),
            ),
          )
        ],
      ),
    );
  }
}
