import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../../../central/strings.dart';
import '../../../controllers/home_news_controller.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    Key? key,
    this.isSearchPage = false,
  }) : super(key: key);

  bool isSearchPage;
  final homeNewsController = Get.find<HomeNewsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE6ECF2),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: TextField(
          enabled: isSearchPage ? true : false,
          keyboardType: TextInputType.text,
          controller: homeNewsController.searchNewsController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(16, 16, 8, 8),
            suffixIcon: InkWell(
              onTap: () {
                homeNewsController.performSearch();
              },
              child: Icon(Icons.search),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            hintText: "Search for news",
          ),
          onSubmitted: (s) {
            homeNewsController.searchNewsController.text = s;
            homeNewsController.performSearch();
          },
        ),
      ),
    );
  }
}
