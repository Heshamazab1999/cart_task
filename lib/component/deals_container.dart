import 'package:cart_task/helper/dimensions.dart';
import 'package:cart_task/helper/styles.dart';
import 'package:cart_task/models/deals_model.dart';
import 'package:flutter/material.dart';

class DealsContainer extends StatelessWidget {
  const DealsContainer(
      {Key? key,
      this.dealsModel,
      this.icon,
      this.function,
      this.color,
      this.addToCart})
      : super(key: key);
  final DealsModel? dealsModel;
  final Function()? function;
  final Color? color;
  final IconData? icon;
  final Function()? addToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                height: Dimensions.height * 0.1,
                width: Dimensions.width * 0.2,
                decoration: BoxDecoration(
                    color: Color(int.parse(dealsModel!.color!)),
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_LARGE)),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: GestureDetector(
                    onTap: function,
                    child: Icon(icon!,
                        color: color, size: Dimensions.fontSizeDefault),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dealsModel!.name!,
                  style: poppinsBold.copyWith(
                      color: const Color(0xFF474749),
                      fontSize: Dimensions.fontSizeExtraSmall)),
              Text("Pieces ${dealsModel!.quantity}",
                  style: poppinsMedium.copyWith(
                      color: const Color(0xFF474749),
                      fontSize: Dimensions.fontSizeExtraSmall)),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: Dimensions.fontSizeLarge,
                    color: const Color(0xFF474749),
                  ),
                  Text(dealsModel!.time!,
                      style: poppinsMedium.copyWith(
                          color: const Color(0xFF474749),
                          fontSize: Dimensions.fontSizeExtraSmall)),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text("\$ ${dealsModel!.price}",
                          style: poppinsBold.copyWith(
                              color: const Color(0xFFEE6A61),
                              fontSize: Dimensions.fontSizeDefault)),
                      const SizedBox(width: 10),
                      Text("\$ ${dealsModel!.discount}",
                          style: poppinsMedium.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: const Color(0xFF464646),
                              fontSize: Dimensions.fontSizeDefault)),
                    ],
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                      onPressed: addToCart,
                      icon: Icon(
                        Icons.add_shopping_cart,
                        size: Dimensions.fontSizeOverLarge,
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
