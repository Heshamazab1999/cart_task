import 'package:cart_task/component/button.dart';
import 'package:cart_task/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: controller.cartProductModel.isEmpty
              ? const Center(
                  child: Text("Empty"),
                )
              : ListView.builder(
                  itemCount: controller.cartProductModel.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // print(controller.dealsModel[index].price);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.width / 5,
                            height: Dimensions.width / 5,
                            decoration: BoxDecoration(
                                color: Color(int.parse(
                                    controller.cartProductModel[index].image!)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.cartProductModel[index].name
                                    .toString()),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${controller.cartProductModel[index].price} \$",
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        ButtonCart(
                                            onTap: () {
                                              controller
                                                  .increaseQuentity(index);
                                            },
                                            icon: Icons.add),
                                        Text(controller
                                            .cartProductModel[index].quantity
                                            .toString()),
                                        ButtonCart(
                                            onTap: () {
                                              controller
                                                  .decreaseQuentity(index);
                                            },
                                            icon: Icons.minimize),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
        ),
      );
    });
  }
}
