import 'package:cart_task/helper/dimensions.dart';
import 'package:cart_task/helper/styles.dart';
import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  final Function(String)? onChange;

  const TextFieldSearch({Key? key, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: "Search in thousands of products",
          hintStyle: poppinsRegular.copyWith(
              fontSize: 11, color: const Color(0xFF474749)),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF707070)),
          filled: true,
          fillColor: const Color(0xFFF5F7F9),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF707070)),
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF707070)),
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE)),
        ),
      ),
    );
  }
}
