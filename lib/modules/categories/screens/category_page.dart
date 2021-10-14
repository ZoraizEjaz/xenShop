import 'package:flutter/material.dart';
import 'package:xenshop/constants/colors_constants.dart';
import 'package:xenshop/constants/string_constants.dart';
import 'package:xenshop/modules/categories/bloc/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenshop/modules/categories/widget/category_item.dart';
import 'package:xenshop/utils/helpers/internet/internet_cubit.dart';
import 'package:badges/badges.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late CategoryBloc _categoryBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(categoriesScreenName),
        backgroundColor: primaryColorDark,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0,top: 5),
            child: Badge(
              badgeContent: const Text('3'),
              child: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      backgroundColor: appBackgroundColor,
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetDisconnected) {
            return const Center(child: Text(noInternetConnected));
          } else {
            return BlocConsumer<CategoryBloc, CategoryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.status) {
                    case CategoryStatus.initial:
                      return const Center(
                          child: CircularProgressIndicator(
                              color: primaryColorDark));
                    case CategoryStatus.success:
                      return Column(
                        children: [body(state.categories)],
                      );
                    default:
                      return Container();
                  }
                });
          }
        },
      ),
    );
  }

  Widget body(List<String> categoryList) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height / 2.3,
        margin: const EdgeInsets.fromLTRB(7, 3, 7, 0),
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.6),
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                  categoryName: categoryList[index], index: index);
            }),
      ),
    );
  }

  @override
  void initState() {
    _categoryBloc = context.read<CategoryBloc>();
    _categoryBloc.add(FetchCategories());
    super.initState();
  }
}
