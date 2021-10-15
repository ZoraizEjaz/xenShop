import 'package:flutter/material.dart';
import 'package:xenshop/constants/colors_constants.dart';
import 'package:xenshop/constants/string_constants.dart';
import 'package:xenshop/modules/products/bloc/products_bloc.dart';
import 'package:xenshop/modules/products/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenshop/modules/shopping_cart/bloc/cart_bloc.dart';
import 'package:xenshop/modules/shopping_cart/model/cart_model.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.product, required this.index})
      : super(key: key);

  final Product product;
  final int index;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late List<CartModel> cartList;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 151,
                  child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0))),
                      child: SizedBox(
                        height: 151,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(
                              height: 90,
                              width: 90.0,
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                child: FadeInImage.assetNetwork(
                                  placeholder:
                                      'assets/images/fade_banner_image.png',
                                  image: widget.product.image!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: SizedBox(
                    height: 151,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0))),
                      child: Container(
                        height: 151,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 35,
                                  child: Text(widget.product.title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: primaryColorDark,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 55,
                                  child: Text(widget.product.description!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: const TextStyle(
                                          color: Colors.black45,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {
                                    context.read<ProductsBloc>().add(AddProduct(productId: widget.product.id!, cartList: cartList));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: primaryColorDark),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 1.5, 10, 1.5),
                                      child: Text(
                                        addToCart,
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  @override
  void initState() {
    cartList = context.read<CartBloc>().state.cartList;
    super.initState();
  }

}

