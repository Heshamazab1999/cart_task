import 'package:cart_task/helper/dimensions.dart';
import 'package:cart_task/helper/styles.dart';
import 'package:cart_task/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final CategoryModel? categoryModel;

  const CategoryContainer({
    Key? key,
    this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      child: Column(
        children: [
          Container(
            width: Dimensions.width * 0.2,
            height: Dimensions.height * 0.1,
            decoration: BoxDecoration(
                color: categoryModel!.color!,
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
          ),
          SizedBox(height: Dimensions.height * 0.01),
          Text(
            categoryModel!.name!,
            style: poppinsMedium.copyWith(
                fontSize: Dimensions.fontSizeExtraSmall,
                color: const Color(0xFF474749)),
          )
        ],
      ),
    );
  }
}
