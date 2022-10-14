import 'package:cart_task/controller/base_controller.dart';
import 'package:cart_task/helper/local_data_base.dart';
import 'package:cart_task/models/deals_model.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  final _dealsModel = <DealsModel>[].obs;

  List<DealsModel> get dealsModel => _dealsModel;
  final favourite = <int, bool>{}.obs;
  final _totalPrice = 0.0.obs;
  final _shippingPrice = 0.0.obs;

  double get shippingPrice => _shippingPrice.value;

  final _totalPriceWithShipping = 0.0.obs;

  double get totalPriceWithShipping => _totalPriceWithShipping.value;

  double get totalPrice => _totalPrice.value;
  List<DealsModel> deals_model = [
    DealsModel(
        id: 1,
        color: "0xFFFF9DC2",
        name: "Summer Sun Ice Cream Pack",
        time: "12 minutes",
        price: "12",
        discount: "18",
        quantity: 5),
    DealsModel(
        id: 2,
        color: "0xFFB0EAFD",
        name: "Summer Sun Ice Cream Pack",
        time: "12 minutes",
        price: "20",
        discount: "18",
        quantity: 5),
  ];

  @override
  onInit() async {
    super.onInit();
    await getAllProducts();
    deals_model.forEach((element) {
      favourite.addAll({element.id!: false});
      print(favourite);
    });
  }

  addToCart(DealsModel dealsModel) async {
    for (int i = 0; i < _dealsModel.length; i++) {
      if (_dealsModel[i].id == dealsModel.id) {
        return Get.snackbar('Filed', 'you added the ${dealsModel.name} before ',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2));
      }
    }
    var dbHelper = LocalDataBase.db;
    await dbHelper.insert(dealsModel);
    _dealsModel.add(dealsModel);
    print(_dealsModel.length);
    _totalPrice.value = 0.0;
    // for (int i = 0; i < _dealsModel.length; i++) {
    //   _totalPrice.value += (double.parse('${_dealsModel[i].price}'));
    //   _totalPriceWithShipping.value = _totalPrice.value + _shippingPrice.value;
    // }
    print(_totalPrice);
    Get.snackbar(
        'Product Added', 'you have added the ${dealsModel.name} to the cart ',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
    update();
  }

  getAllProducts() async {
    var db = LocalDataBase.db;
    _dealsModel.value = (await db.getAllProduct())!;
    // getTotalPrice();
    update();
    print(_dealsModel.length);
  }

  deleteProduct(String name) async {
    var db = LocalDataBase.db;
    await db.deleteProduct(name);
    getAllProducts();
    // getTotalPrice();
    update();
  }

  // favouriteFunction(int index, DealsModel model, String name) {
  //   bool x = (favourite[index] = !favourite[index]!);
  //   if (x == true) {
  //     addToCart(model);
  //     print(favourite);
  //     getAllProducts();
  //   } else {
  //     deleteProduct(name);
  //     getAllProducts();
  //     print(favourite);
  //   }
  // }
}
