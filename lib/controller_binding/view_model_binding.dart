import 'package:cart_task/controller/base_controller.dart';
import 'package:cart_task/controller/main_controller.dart';
import 'package:get/get.dart';

class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController(), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
  }
}
