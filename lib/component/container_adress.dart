import 'package:cart_task/helper/dimensions.dart';
import 'package:cart_task/helper/styles.dart';
import 'package:cart_task/models/adress_model.dart';
import 'package:flutter/material.dart';

class ContainerAddress extends StatelessWidget {
  final AddressModel? addressModel;

  const ContainerAddress({
    Key? key,
    this.addressModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.RADIUS_LARGE,
            ),
            border: Border.all(color: const Color(0xFFE3DDD6))),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Row(
            children: [
              Container(
                width: Dimensions.width * 0.18,
                height: Dimensions.height * 0.09,
                decoration: BoxDecoration(
                    color: const Color(0xFFE3DDD6),
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_LARGE)),
              ),
              SizedBox(width: Dimensions.width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addressModel!.address!,
                    style: poppinsBold.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: const Color(0xFF474749)),
                  ),
                  Text(
                    addressModel!.title!,
                    style: poppinsMedium.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: const Color(0xFF474749)),
                  ),
                  Text(
                    addressModel!.street!,
                    style: poppinsMedium.copyWith(
                        fontSize: Dimensions.fontSizeExtraSmall,
                        color: const Color(0xFF474749)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
