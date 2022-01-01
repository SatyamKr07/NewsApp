import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsNews extends StatelessWidget {
  const DetailsNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
            imageBuilder: (context, imageProvider) => Container(
              width: Get.width,
              height: Get.width * 3 / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
              children: const [
                Text(
                  "News Source",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text("Sept 22,2020 at 4:55 pm"),
                SizedBox(height: 24),
                Text("This is where the detailed news wil be shown to you."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
