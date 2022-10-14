import 'package:cart_task/helper/dimensions.dart';
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Dimensions.width * 0.1,
      height: Dimensions.width * 0.1,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xFF707070))),
    );
  }
}
