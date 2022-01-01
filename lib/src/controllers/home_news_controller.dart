import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app/src/central/my_logger.dart';

class HomeNewsController extends GetxController {
  Dio dio = Dio();
  Future getNews() async {
    String apiUri =
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=5d6a9967f4cc40d3991cf59116e5c149";
    try {
      Response response = await dio.get(apiUri);
      logger.d('getNews response $response');
    } catch (e) {
      logger.e('getNews error $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNews();
  }
}
