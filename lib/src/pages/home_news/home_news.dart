import 'package:flutter/material.dart';
import 'package:news_app/src/pages/home_news/views/news_list.dart';
import 'package:news_app/src/pages/home_news/views/sort_dropdown.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("MyNEWS"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location"),
                Row(
                  children: const [
                    Icon(Icons.location_on, size: 16),
                    Text("India")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
              decoration:
                  InputDecoration(label: Text("Search for news, topic")),
            ),
            SizedBox(height: 20),
            Container(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Top Headlines",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("sort : "),
                        SortDropdown(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            NewsList(),
          ],
        ),
      ),
    );
  }
}