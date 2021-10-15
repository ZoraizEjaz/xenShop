part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserCartList extends CartEvent {}

class RemoveProductFromCart extends CartEvent {
  final int cartId;
  final int productId;
  RemoveProductFromCart({required this.cartId, required this.productId});

  @override
  List<Object?> get props => [cartId];
}

class ChangeStateCart extends CartEvent {}
