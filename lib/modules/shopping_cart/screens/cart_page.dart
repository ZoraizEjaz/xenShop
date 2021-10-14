import 'package:flutter/material.dart';
import 'package:xenshop/constants/app_constants.dart';
import 'package:xenshop/constants/colors_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenshop/constants/string_constants.dart';
import 'package:xenshop/modules/shopping_cart/bloc/cart_bloc.dart';
import 'package:xenshop/modules/shopping_cart/widget/cart_item.dart';
import 'package:xenshop/utils/helpers/internet/internet_cubit.dart';
import 'package:xenshop/utils/ui/custom_elevated_button.dart';


class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartBloc _cartBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(cartScreenName),backgroundColor: primaryColorDark),
      backgroundColor: appBackgroundColor,
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if(state is InternetDisconnected){
            return const Center(child: Text(noInternetConnected));
          }else{
            return Padding(
              padding: const EdgeInsets.all(8),
              child: BlocConsumer<CartBloc, CartState>(
                listener: (context, state){},
                builder: (context,state){
                  switch(state.status){
                    case CartStatus.initial:
                      return const Center(child: CircularProgressIndicator(color: primaryColorDark));
                    case CartStatus.success:
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.cartList.length,
                                itemBuilder: (context, index) {
                                  return CartItem(cart: state.cartList[index], index: index);
                                }),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: CustomElevatedButton(
                                  text: checkOutLbl,
                                  width: 250.0,
                                  height: 50,
                                  buttonColor: primaryColorDark,
                                  onPressed: (){
                                    showAlertDialog(context);
                                  }),
                            )
                          )
                        ],
                      );
                    case CartStatus.failure:
                      return Container();
                    default:
                      return Container();
                  }
                },
              ),
            );
          }
        })
    );
  }

  @override
  void initState() {
    _cartBloc = context.read<CartBloc>();
    _cartBloc.add(FetchUserCartList());
    super.initState();
  }


  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed:  () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(navPaymentPage);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert!"),
      content: const Text("Would you like to checkout?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
