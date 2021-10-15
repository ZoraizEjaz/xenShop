import 'package:flutter/material.dart';
import 'package:xenshop/modules/shopping_cart/bloc/cart_bloc.dart';
import 'package:xenshop/modules/shopping_cart/model/cart_model.dart';
import 'package:intl/intl.dart';
import 'package:xenshop/modules/shopping_cart/widget/cart_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cart, required this.index})
      : super(key: key);
  final CartModel cart;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'Date : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(localDate(cart.date!),  style: const TextStyle(fontSize: 16)),
          ],
        ),

        ListView.builder(
            shrinkWrap: true,
            itemCount: cart.products!.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                background: Container(color: Colors.red, child: const Icon(Icons.delete, color: Colors.white)),
                onDismissed: (direction){
                  setState(){
                    cart.products!.removeAt(index);
                  }
                  context.read<CartBloc>().add(RemoveProductFromCart(cartId: cart!.id!, productId: cart.products![index].productId!));
                },
                child: CartRow(products: cart.products![index]),
              );
            }),
        const SizedBox(height: 20),
      ],
    );
  }

  String localDate(String currentDate) {
    if (currentDate.isEmpty) {
      return '';
    } else {
      DateTime tempDate = DateFormat('yyyy-MM-dd').parse(currentDate);
      String date = DateFormat("dd MMM yyyy").format(tempDate);
      return date;
    }
  }
}
