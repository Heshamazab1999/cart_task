import 'package:cart_task/component/circle_container.dart';
import 'package:cart_task/component/curved_container.dart';
import 'package:cart_task/component/deals_container.dart';
import 'package:cart_task/controller/favourite_controller.dart';
import 'package:cart_task/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
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
            // Obx(() => ListView.builder(
            //     physics: BouncingScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: controller.cartProductModel.length,
            //     itemBuilder: (ctx, index) {
            //       print(controller.cartProductModel[0].time);
            //     return Text("data");
            //     }))
          ],
        ),
      ),
    );
  }
}
