part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserCartList extends CartEvent {}

class RemoveProductFromCart extends CartEvent {}