import "package:flutter/material.dart";
import 'package:xenshop/constants/colors_constants.dart';

class CategoryItem extends StatelessWidget{
  final String categoryName;
  final int index;
  const CategoryItem({Key? key, required this.categoryName, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: primaryColorDark, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: dataTypeCellBackground),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categoryName, style: const TextStyle(color: primaryColorDark)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}