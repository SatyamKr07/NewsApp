import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsTemplate extends StatelessWidget {
  const NewsTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "News Source",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Lorem ispusm...News will be displayed here.",
                    style: TextStyle(),
                  ),
                  // Expanded(child: Spacer()),
                  Text("10 min ago"),
                ],
              ),
            ),
            CachedNetworkImage(
              imageUrl:
                  "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
              imageBuilder: (context, imageProvider) => Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
