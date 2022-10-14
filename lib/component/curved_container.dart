import 'package:cart_task/helper/dimensions.dart';
import 'package:cart_task/helper/images.dart';
import 'package:cart_task/helper/styles.dart';
import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({Key? key, this.address}) : super(key: key);
  final String? address;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Images.curvedContainer),
        Row(
          children: [
            Icon(Icons.location_on_outlined,
                color: Colors.white, size: Dimensions.fontSizeSmall),
            const Padding(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
            Text(
              address!,
              style: poppinsMedium.copyWith(
                  color: Colors.white, fontSize: Dimensions.fontSizeSmall),
            ),
          ],
        )
      ],
    );
  }
}
