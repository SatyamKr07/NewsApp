import 'package:get/instance_manager.dart';
import 'package:news_app/src/controllers/home_news_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNewsController>(() => HomeNewsController(), fenix: true);
  }
}
