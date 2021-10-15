part of 'products_bloc.dart';

class ProductEvents extends Equatable{
  @override
  List<Object?> get props => [];
}

class FetchProductByCategory extends ProductEvents {
  final String categoryType;
  FetchProductByCategory({required this.categoryType});

  @override
  List<Object> get props => [categoryType];
}

class ResetState extends ProductEvents {}

class ChangeState extends ProductEvents {}

class AddProduct extends ProductEvents {
  final int productId;
  final List<CartModel> cartList;
  AddProduct({required this.productId,required this.cartList});

  @override
  List<Object> get props => [productId, cartList];

}
