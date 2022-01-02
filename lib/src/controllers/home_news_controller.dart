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

  List<Map<String, String>> countriesList = [
    {"Nepal": "np"},
    {"USA": "us"},
    {"India": "in"},
    {"Sri Lanka": "sl"},
    {"England": "en"},
    {"Sweden": "sw"},
    {"Pacific Islands": "pi"},
  ];

  Future getNews() async {
    String apiUri =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=$newsApiKey";
    // "https://newsapi.org/v2/everything?q=bitcoin&apiKey=$newsApiKey";
    try {
      isLoading = true;
      update(['NEWS_LIST']);
      Response response = await dio.get(apiUri);
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNews();
  }
}
