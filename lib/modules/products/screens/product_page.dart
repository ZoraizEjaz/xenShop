import 'package:flutter/material.dart';
import 'package:xenshop/constants/colors_constants.dart';
import 'package:xenshop/constants/string_constants.dart';
import 'package:xenshop/modules/categories/bloc/category_bloc.dart';
import 'package:xenshop/modules/products/bloc/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenshop/modules/products/widget/product_item.dart';
import 'package:xenshop/utils/helpers/internet/internet_cubit.dart';
import 'package:badges/badges.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductsBloc _productsBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(productScreenName),
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
              return BlocConsumer<ProductsBloc, ProductState>(
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.status) {
                    case ProductStatus.initial:
                      return const Center(
                          child: CircularProgressIndicator(
                              color: primaryColorDark));
                    case ProductStatus.success:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(children: [
                              const Text(categoryLbl + ' : ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              Text(context.read<CategoryBloc>().state.selectedCatName),
                            ]
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.productsList.length,
                                itemBuilder: (context, index) {
                                  return ProductItem(
                                      product: state.productsList[index],
                                      index: index);
                                }),
                          )
                        ],
                      );
                    case ProductStatus.failure:
                      return Container();
                    default:
                      return Container();
                  }
                },
              );
            }
          },
        ));
  }

  @override
  void initState() {
    _productsBloc = context.read<ProductsBloc>();
    String selectedCatName = context.read<CategoryBloc>().state.selectedCatName;
    _productsBloc.add(FetchProductByCategory(categoryType: selectedCatName));
    super.initState();
  }
}
