part of 'cart_bloc.dart';

enum CartStatus {initial, loading, success, failure}

class CartState extends Equatable{
  final CartStatus status;
  final String message;
  final int totalItemsInCart;
  final List<CartModel> cartList;

  const CartState({
    this.status = CartStatus.initial,
    this.message = '',
    this.totalItemsInCart = 0,
    this.cartList = const <CartModel>[]
});

  CartState copyWith({
    CartStatus? status,
    String? message,
    int? totalItemsInCart,
    List<CartModel>? cartList,
  }) {
    return CartState(
      status: status ?? this.status,
      message: message ?? this.message,
      totalItemsInCart: totalItemsInCart ?? this.totalItemsInCart,
      cartList: cartList ?? this.cartList,
    );
  }

  @override
  List<Object?> get props=> [status,message, cartList, totalItemsInCart];
}
