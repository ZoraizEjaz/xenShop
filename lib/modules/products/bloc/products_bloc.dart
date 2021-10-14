import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenshop/modules/products/model/product.dart';
import 'package:xenshop/modules/products/repository/products_repository.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductEvents, ProductState> {
  ProductsBloc({required this.productRepository}) : super(const ProductState());
  ProductRepository productRepository;

  @override
  Stream<ProductState> mapEventToState(ProductEvents event) async* {
    if (event is FetchProductByCategory) {
      yield await mapProductByCategoryToState(state, event);
    }else if (event is ResetState){
      yield state.copyWith(
        status: ProductStatus.initial,
        productsList: [],
        message: ''
      );
    }
  }

  Future<ProductState> mapProductByCategoryToState(
      ProductState state, FetchProductByCategory event) async {
    try {
      final response = await productRepository.getProductsByCategoryType(
          categoryType: event.categoryType);
      var mappedList = response.map((i) => Product.fromJson(i)).toList();
      List<Product> list = [];
      for(int i=0 ; i<mappedList.length; i++){
        list.add(mappedList[i]);
      }
      return state.copyWith(
          status: ProductStatus.success,
          message: 'success',
          productsList: list);
    } on Exception {
      return state.copyWith(status: ProductStatus.failure, message: '');
    }
  }
}
