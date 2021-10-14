import 'package:flutter/material.dart';
import 'package:xenshop/constants/colors_constants.dart';
import 'package:xenshop/modules/shopping_cart/model/cart_model.dart';

class CartRow extends StatelessWidget {
  const CartRow({Key? key, required this.products}) : super(key: key);
  final Products products;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius:BorderRadius.all(Radius.circular(8)),
        ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
            children: [
            const Text(
            'Product ID : ',
              style: TextStyle(
                  color: primaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
           Text(products.productId.toString()),
          ],
        ),
            Row(
              children: [
                const Text(
                  'Quantity: ',
                  style: TextStyle(
                      color: primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
                Text(products.quantity.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
