import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/models/news_model.dart';

class DetailsNews extends StatelessWidget {
  const DetailsNews({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(),
      body: SizedBox(
        height: Get.height,
        child: ListView(
          // shrinkWrap: true,
          children: [
            CachedNetworkImage(
              imageUrl: newsModel.urlToImage,
              imageBuilder: (context, imageProvider) => Container(
                width: Get.width,
                height: Get.width * 3 / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              width: Get.width,
              height: Get.width * 3 / 4,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsModel.title,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    newsModel.publishedAt.toString(),
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    newsModel.description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  // Spacer(),
                  // Expanded(child: Container()),
                  Text(
                    "See full Story",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
