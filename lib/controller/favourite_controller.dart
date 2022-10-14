import 'package:cart_task/controller/base_controller.dart';
import 'package:cart_task/helper/local_data_base.dart';
import 'package:cart_task/models/deals_model.dart';
import 'package:get/get.dart';

class FavouriteController extends BaseController {
  final List<DealsModel> _cartProductModel = [];

  List<DealsModel> get cartProductModel => _cartProductModel;

  @override
  onInit() async {
    super.onInit();
    await getAllProductList();
  }

  getAllProductList() async {
    var dbHelper = LocalDataBase.db;
    _cartProductModel.assignAll(await dbHelper.getAllProduct());
    // _cartProductModel.s await dbHelper.getAllProduct();
    // getTotalPrice();
    update();
    print(_cartProductModel[0].time);
  }
}
