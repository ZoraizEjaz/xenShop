import "package:flutter/material.dart";
import 'package:xenshop/constants/app_constants.dart';
import 'package:xenshop/constants/colors_constants.dart';
import 'package:xenshop/modules/categories/bloc/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenshop/modules/products/bloc/products_bloc.dart';

class CategoryItem extends StatelessWidget{
  final String categoryName;
  final int index;
  const CategoryItem({Key? key, required this.categoryName, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.read<CategoryBloc>().add(AddSelectedCategoryIndex(selectedCatName: categoryName));
        context.read<ProductsBloc>().add(ResetState());
        Navigator.of(context).pushNamed(navProductPage);
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