import 'package:get/instance_manager.dart';
import '../controllers/home_news_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeNewsController>(() => HomeNewsController(), fenix: true);
  }
}
