import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart' hide Response;

import '../central/my_logger.dart';
import '../central/strings.dart';
import '../models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeNewsController extends GetxController {
  Dio dio = Dio();
  List<NewsModel> newsList = [];
  bool isLoading = false;
  String selectedCountry = "India";
  String tempCountry = "India";
  String? selectedCountryCode = "in";
  int? selectedValue = 2;

  String? sortBy = "popularity";

  TextEditingController searchNewsController = TextEditingController();

  List<Map<String, String>> countriesList = [
    {"Nepal": "np"},
    {"USA": "us"},
    {"India": "in"},
    {"Sri Lanka": "lk"},
    {"England": "gb-eng"},
    {"Sweden": "sg"},
    {"Pacific Islands": "pc"},
  ];

  bool hasMore = true;
  int pageNum = 1;
  ScrollController scrollController = ScrollController();

  Future getNewsWithPagination({required String apiUrl}) async {
    logger.d("in getNews, apiUrl $apiUrl");

    if (!hasMore) return;

    try {
      //@note below 2 lines start the circular progress bar
      isLoading = true;
      update(['NEWS_LIST']);

      List<NewsModel> tempNewsList = [];
      Response response =
          await dio.get(apiUrl); // @note hide Response from getx package
      // logger.d('getNews response $response');
      if (response.statusCode == 200) {
        logger.d('getNews totalResults ${response.data['totalResults']}');
        if (response.data['articles'].length < 10) {
          logger.d("hasMore data $hasMore");
          hasMore = false;
        } else {
          hasMore = true;
          logger.d("hasMore $hasMore");
        }
        for (Map<String, dynamic> json in response.data['articles']) {
          logger.d("json: " + json.toString());
          logger.d("json['articles']: " + json.toString());

          NewsModel newsModel = NewsModel.fromJson(json);
          tempNewsList.add(newsModel);
        }
        newsList.addAll(tempNewsList);
        logger.d("newsList.length: ${newsList.length}");
      }
    } catch (e) {
      logger.e('getNews error $e');
    } finally {
      isLoading = false;
      update(['NEWS_LIST']);
    }
  }

  resetNewsData() {
    hasMore = true;
    newsList.clear();
    pageNum = 1;
  }

  void getCountryNews() {
    logger.d(' homeNewsController.tempCountry $tempCountry');
    logger.d('homeNewsController.selectedCountry $selectedCountry');
    resetNewsData();
    getNewsWithPagination(
      apiUrl:
          "https://newsapi.org/v2/top-headlines?country=$selectedCountryCode&apiKey=$newsApiKey",
    );
  }

  changeSortCategory(String? s) {
    resetNewsData();
    sortBy = s;
    logger.d("sortBy $sortBy");
    getNewsWithPagination(
        apiUrl:
            "https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&country=$selectedCountryCode&sortBy=$sortBy&apiKey=$newsApiKey");
    update(['SORT_BY']);
  }

  void performSearch() {
    resetNewsData();
    getNewsWithPagination(
        apiUrl:
            "https://newsapi.org/v2/everything?pageSize=20&page=$pageNum&q=${searchNewsController.text}&sortBy=publishedAt&apiKey=$newsApiKey");
  }

  void launchURL({required String url}) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNewsWithPagination(
        apiUrl:
            "https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&country=in&apiKey=$newsApiKey");
    scrollController.addListener(() {
      // logger.d("scroll controller called===============");
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = Get.height * 0.25;
      if (maxScroll - currentScroll <= delta) {
        pageNum += 1;
        logger.d('scrollListner');
        getNewsWithPagination(
            apiUrl:
                "https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&country=in&apiKey=$newsApiKey");
      }
    });
  }
}
