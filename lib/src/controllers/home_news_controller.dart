import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app/src/central/my_logger.dart';
import 'package:news_app/src/central/strings.dart';
import 'package:news_app/src/models/news_model.dart';

class HomeNewsController extends GetxController {
  Dio dio = Dio();
  List<NewsModel> newsList = [];
  bool isLoading = false;
  String selectedCountry = "India";
  String tempCountry = "India";
  String? selectedCountryCode = "in";
  int? selectedValue = 2;

  String? sortBy = "popularity";

  List<Map<String, String>> countriesList = [
    {"Nepal": "np"},
    {"USA": "us"},
    {"India": "in"},
    {"Sri Lanka": "lk"},
    {"England": "gb-eng"},
    {"Sweden": "sg"},
    {"Pacific Islands": "pc"},
  ];

  Future getNews({required String apiUrl}) async {
    // selectedCountryCode=countriesList[]
    // String apiUri =
    //     "https://newsapi.org/v2/top-headlines?country=in&apiKey=$newsApiKey";
    // "https://newsapi.org/v2/everything?q=bitcoin&apiKey=$newsApiKey";
    newsList.clear();
    try {
      isLoading = true;
      update(['NEWS_LIST']);
      Response response = await dio.get(apiUrl);
      logger.d('getNews response $response');
      for (Map<String, dynamic> json in response.data['articles']) {
        logger.d("json: " + json.toString());
        logger.d("json['articles']: " + json.toString());
        NewsModel newsModel = NewsModel.fromJson(json);
        newsList.add(newsModel);
      }
      logger.d("newsList.length: ${newsList.length}");
    } catch (e) {
      logger.e('getNews error $e');
    } finally {
      isLoading = false;
      update(['NEWS_LIST']);
    }
  }

  changeSortCategory(String? s) {
    sortBy = s;
    logger.d("sortBy $sortBy");
    getNews(
        apiUrl:
            "https://newsapi.org/v2/top-headlines?country=in&sortBy=$sortBy&apiKey=$newsApiKey");
    update(['SORT_BY']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNews(
        apiUrl:
            "https://newsapi.org/v2/top-headlines?country=in&apiKey=$newsApiKey");
  }
}
