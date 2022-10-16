import 'package:cart_task/helper/dimensions.dart';
import 'package:flutter/material.dart';

class ButtonCart extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;

  const ButtonCart({Key? key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
        width: Dimensions.width * 0.1,
        height: Dimensions.height * 0.05,
        decoration: BoxDecoration(
          color: const Color(0xFFB0EAFD),
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
        ),
        child:  Icon(icon!, color: const Color(0xFF48B6DA)),
      ),
    );
  }
}
