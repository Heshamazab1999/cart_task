import 'package:cart_task/controller/base_controller.dart';
import 'package:cart_task/controller/main_controller.dart';
import 'package:cart_task/screens/favourite_screen.dart';
import 'package:cart_task/screens/main_screen.dart';
import 'package:cart_task/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/images.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BaseController());
    final List<Widget> screens = [
      const MainScreen(),
      const NewsScreen(),
      const FavouriteScreen(),
      const CartScreen(),
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() => screens.elementAt(controller.selectedIndex)),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFD93E11),
          elevation: 1,
          child: Stack(
            children: [
              Obx(() => Text(
                    "${MainController.to.totalPrice}\$",
                    style: const TextStyle(fontSize: 10),
                  )),
              Image.asset(Images.shoppingIcon),
            ],
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.selected(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFFD93E11),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  Images.marketIcon,
                  color: controller.selectedIndex == 0
                      ? const Color(0xFFD93E11)
                      : const Color(0xFF707070),
                ),
                label: "Grocery",
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    Images.notificationIcon,
                    color: controller.selectedIndex == 1
                        ? const Color(0xFFD93E11)
                        : const Color(0xFF707070),
                  ),
                  label: "News"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    Images.favoritesIcon,
                    color: controller.selectedIndex == 2
                        ? const Color(0xFFD93E11)
                        : const Color(0xFF707070),
                  ),
                  label: "favorite"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    Images.shoppingIcon,
                    color: controller.selectedIndex == 3
                        ? const Color(0xFFD93E11)
                        : const Color(0xFF707070),
                  ),
                  label: "Cart"),
            ],
          ),
        ));
  }
}
