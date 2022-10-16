import 'package:cart_task/component/circle_container.dart';
import 'package:cart_task/component/curved_container.dart';
import 'package:cart_task/controller/main_controller.dart';
import 'package:cart_task/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                controller.favouriteModel.isEmpty
                    ? const Center(
                        child: Text("Empty"),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.favouriteModel.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.width / 5,
                                  height: Dimensions.width / 5,
                                  decoration: BoxDecoration(
                                      color: Color(int.parse(controller
                                          .favouriteModel[index].image!)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(controller.favouriteModel[index].name
                                          .toString()),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${controller.favouriteModel[index].price} \$",
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
              ],
            ),
          ),
        );
      },
    );
  }
}
