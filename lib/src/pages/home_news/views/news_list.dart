import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:news_app/src/pages/details_news/details_news.dart';

import 'news_template.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: InkWell(
            onTap: () {
              Get.to(() => DetailsNews());
            },
            child: NewsTemplate(),
          ),
        );
      },
    );
  }
}
