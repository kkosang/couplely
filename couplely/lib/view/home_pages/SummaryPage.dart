import 'package:couplely/view/home_pages/DiaryPage.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade800,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade800,
              height: screenSize.height * 0.05,
            ),
            Column(
              children: List.generate(
                4,
                (index) => Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                      borderRadius:
                          BorderRadius.all(Radius.circular(20)),),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'November',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GridView.count(
                            crossAxisCount: 5,
                            shrinkWrap: true,
                            childAspectRatio: 1,
                            children: List.generate(
                                20,
                                (index) => TextButton(
                                  onPressed: () {Navigator.push(
                                      context,
                                      MaterialPageRoute(builder:
                                      (context) => DiaryPage()),
                                  );},
                                  child: Container(
                                    width: screenSize.width * 0.2,
                                    height: screenSize.width * 0.2,
                                    child: Image.network('https://i.namu.wiki/i/I7rS3Y4vnX0neHzRIL5S0iZ6aAZQMTgB-usPt142UZwZKGuVUDH8GnI-mNKdqUOe5MITYPik0IhB20ZJgTjFzCfoVbdKYEtrBX04xNQ7G_0I0vqA43bnWSdaf5qOIpHc7-3xTw8msU3O2EpAuwGAXw.webp'),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
