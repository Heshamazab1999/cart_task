import 'package:get/get.dart';

class BaseController extends GetxController {
  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  selected(int index) {
    _selectedIndex.value = index;
  }
}
