import 'package:cart_task/helper/dimensions.dart';
import 'package:cart_task/helper/styles.dart';
import 'package:flutter/material.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      child: Container(
        height: Dimensions.height * 0.15,
        width: Dimensions.width,
        decoration: BoxDecoration(
            color: const Color(0xFFFEC8BD),
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
        child: Row(
          children: [
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mega",
                  style: poppinsMedium.copyWith(
                      color: const Color(0xFFD03A27),
                      fontSize: Dimensions.fontSizeExtraSmall),
                ),
                RichText(
                  text: TextSpan(
                    text: 'WHOPP',
                    style: poppinsBold.copyWith(
                        color: const Color(0xFF21114B),
                        fontSize: Dimensions.fontSizeOverLarge),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'E',
                        style: poppinsBold.copyWith(
                            color: const Color(0xFFD03A27),
                            fontSize: Dimensions.fontSizeOverLarge),
                      ),
                      TextSpan(
                        text: 'R',
                        style: poppinsBold.copyWith(
                            color: const Color(0xFF21114B),
                            fontSize: Dimensions.fontSizeOverLarge),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("\$ 12",
                        style: poppinsBold.copyWith(
                            color: const Color(0xFFEE6A61),
                            fontSize: Dimensions.fontSizeDefault)),
                    const SizedBox(width: 10),
                    Text("\$ 18",
                        style: poppinsRegular.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeDefault)),
                  ],
                ),
                Text(
                  "* Available until 24 December 2020",
                  style: poppinsMedium.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeExtraSmall),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
