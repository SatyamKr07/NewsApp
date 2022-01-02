import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:news_app/src/pages/home_news/views/country_bms.dart';
import 'package:news_app/src/pages/home_news/views/news_list.dart';
import 'package:news_app/src/pages/home_news/views/sort_dropdown.dart';

import 'views/search_result_page.dart';
import 'views/search_text_field.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F9FD),
      appBar: AppBar(
        title: Text("MyNEWS"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CountryBms(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => SearchResultPage());
              },
              child: SearchTextField(),
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
