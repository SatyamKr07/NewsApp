import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:news_app/src/central/my_logger.dart';
import 'package:news_app/src/controllers/home_news_controller.dart';
import 'package:news_app/src/models/news_model.dart';
import 'package:news_app/src/pages/details_news/details_news.dart';

import 'news_template.dart';

class NewsList extends StatelessWidget {
  NewsList({Key? key}) : super(key: key);
  final homeNewsController = Get.find<HomeNewsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNewsController>(
      id: "NEWS_LIST",
      builder: (_) =>
          homeNewsController.newsList.isEmpty && homeNewsController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    logger.d('inside scroll Notification outside if');

                    if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                      // start loading data
                      // setState(() {
                      //   isLoading = true;
                      // });
                      // _loadData();
                      // logger.d('inside scroll Notification');
                      homeNewsController.doPagination();
                    }
                    return true;
                  },
                  child: ListView.builder(
                    // controller: homeNewsController.scrollController,
                    shrinkWrap: true,
                    itemCount: homeNewsController.newsList.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == homeNewsController.newsList.length - 1) {
                        return Column(children: [
                          newsListBody(index),
                          if (homeNewsController.hasMore &&
                              homeNewsController.isLoading)
                            CircularProgressIndicator(),
                        ]);
                      }
                      // NewsModel newsModel = NewsModel();
                      return newsListBody(index);
                    },
                  ),
                ),
    );
  }

  Padding newsListBody(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: () {
          Get.to(
              () => DetailsNews(newsModel: homeNewsController.newsList[index]));
        },
        child: NewsTemplate(
          newsModel: homeNewsController.newsList[index],
        ),
      ),
    );
  }
}
