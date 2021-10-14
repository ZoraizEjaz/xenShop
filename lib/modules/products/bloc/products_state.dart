part of 'products_bloc.dart';

enum ProductStatus {initial, loading, success, failure}

class ProductState extends Equatable{
  final ProductStatus status;
  final String message;
  final List<Product> productsList;

  const ProductState({
    this.status = ProductStatus.initial,
    this.message = '',
    this.productsList = const <Product>[]
});

  ProductState copyWith({
    ProductStatus? status,
    String? message,
    List<Product>? productsList,
  }) {
    return ProductState(
      status: status ?? this.status,
      message: message ?? this.message,
      productsList: productsList ?? this.productsList,
    );
  }

  @override
  List<Object?> get props => [status, message, productsList];
}
