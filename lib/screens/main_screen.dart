import 'package:cart_task/component/banner.dart';
import 'package:cart_task/component/category_container.dart';
import 'package:cart_task/component/circle_container.dart';
import 'package:cart_task/component/container_adress.dart';
import 'package:cart_task/component/curved_container.dart';
import 'package:cart_task/component/deals_container.dart';
import 'package:cart_task/component/text_field_search.dart';
import 'package:cart_task/controller/main_controller.dart';
import 'package:cart_task/helper/dimensions.dart';
import 'package:cart_task/helper/styles.dart';
import 'package:cart_task/models/adress_model.dart';
import 'package:cart_task/models/cart_model.dart';
import 'package:cart_task/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AddressModel> address = [
      AddressModel(
        address: "Mustafa St. No:2",
        title: "Mustafa St. No:2",
        street: "Street x12",
      ),
      AddressModel(
        address: "Mustafa St. No:2",
        title: "Mustafa St. No:2",
        street: "Street x12",
      ),
      AddressModel(
        address: "Mustafa St. No:2",
        title: "Mustafa St. No:2",
        street: "Street x12",
      ),
    ];
    List<CategoryModel> category = [
      CategoryModel(
        name: "Steak",
        color: const Color(0xFFF9BDAD),
      ),
      CategoryModel(
        name: "Vegetables",
        color: const Color(0xFFFAD96D),
      ),
      CategoryModel(
        name: "Beverages",
        color: const Color(0xFFCCB8FF),
      ),
      CategoryModel(
        name: "Fish",
        color: const Color(0xFFB0EAFD),
      ),
      CategoryModel(
        name: "Juice",
        color: const Color(0xFFFF9DC2),
      ),
    ];
    final controller = Get.put(MainController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height * 0.05),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CurvedContainer(address: "Mustafa St."),
                  CircleContainer(),
                ],
              ),
            ),
            TextFieldSearch(
              onChange: (value) {},
            ),
            SizedBox(
              height: Dimensions.height * 0.15,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: address.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) => ContainerAddress(
                        addressModel: address[index],
                      )),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore by Category",
                    style: poppinsBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: const Color(0xFF474749)),
                  ),
                  Text(
                    "See All (36)",
                    style: poppinsMedium.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: const Color(0xFF929294)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height * 0.18,
              child: ListView.builder(
                  itemCount: category.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => CategoryContainer(
                        categoryModel: category[index],
                      )),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              child: Text(
                "Deals of the day",
                style: poppinsBold.copyWith(
                    fontSize: Dimensions.fontSizeExtraSmall,
                    color: const Color(0xFF474749)),
              ),
            ),
            SizedBox(
              height: Dimensions.height * 0.2,
              child: ListView.builder(
                  itemCount: controller.deals_model.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() => DealsContainer(
                        addToCart: () {
                          controller.addToCart(CartProductModel(
                            quantity: 1,
                            name: controller.deals_model[index].name,
                            price:
                                int.parse(controller.deals_model[index].price!),
                            image: controller.deals_model[index].color,
                            productId:
                                controller.deals_model[index].id.toString(),
                          ));
                        },
                        icon: controller.favourite[
                                    controller.deals_model[index].id] ==
                                false
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: controller.favourite[
                                    controller.deals_model[index].id] ==
                                false
                            ? Colors.grey
                            : Colors.red,
                        function: () {
                          controller.favouriteFunction(
                            controller.deals_model[index].id!,
                            CartProductModel(
                              name: controller.deals_model[index].name,
                              image: controller.deals_model[index].color
                                  .toString(),
                              quantity: 1,
                              price: int.parse(
                                  controller.deals_model[index].price!),
                            ),
                            controller.deals_model[index].name!,
                          );
                        },
                        dealsModel: controller.deals_model[index],
                      ))),
            ),
            const BannerContainer()
          ],
        ),
      ),
    );
  }
}
