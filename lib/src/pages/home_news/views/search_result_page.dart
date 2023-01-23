import 'package:flutter/material.dart';
import 'news_list.dart';
import 'search_text_field.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Search")),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SearchTextField(isSearchPage: true),
              ),
              SizedBox(height: 16),
              NewsList(),
            ],
          ),
        ));
  }
}
