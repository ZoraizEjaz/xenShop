import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenshop/modules/products/model/product.dart';
import 'package:xenshop/modules/products/model/product_sending_model.dart'
    as sending_product_model;
import 'package:xenshop/modules/products/repository/products_repository.dart';
import 'package:xenshop/modules/shopping_cart/model/cart_model.dart';
import 'package:intl/intl.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductEvents, ProductState> {
  ProductsBloc({required this.productRepository}) : super(const ProductState());
  ProductRepository productRepository;

  @override
  Stream<ProductState> mapEventToState(ProductEvents event) async* {
    if (event is FetchProductByCategory) {
      yield await mapProductByCategoryToState(state, event);
    } else if (event is ResetState) {
      yield state.copyWith(
          status: ProductStatus.initial, productsList: [], message: '');
    } else if (event is AddProduct) {
      yield await mapProductToCartState(state, event);
    } else if (event is ChangeState) {
      yield state.copyWith(status: ProductStatus.success);
    }
  }

  Future<ProductState> mapProductByCategoryToState(
      ProductState state, FetchProductByCategory event) async {
    try {
      final response = await productRepository.getProductsByCategoryType(
          categoryType: event.categoryType);
      var mappedList = response.map((i) => Product.fromJson(i)).toList();
      List<Product> list = [];
      for (int i = 0; i < mappedList.length; i++) {
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

  Future<ProductState> mapProductToCartState(
      ProductState state, AddProduct event) async {
    try {
      sending_product_model.Product_sending_model productSendingModel =
          sending_product_model.Product_sending_model();
      productSendingModel.setUserId = 3;
      productSendingModel.setDate = localDate(DateTime.now().toString());
      List<sending_product_model.Products> tempProduct = [];

      //Adding new product in cart list
      if (checkNewProduct(event.cartList, event.productId)) {
        sending_product_model.Products products =
            sending_product_model.Products(
                productId: event.productId, quantity: 1);
        tempProduct.add(products);
        productSendingModel.setProducts = tempProduct;
        //print(json.encode(productSendingModel));
        final response =
            await productRepository.addProductToCart(body: productSendingModel);
      } else {
        // updating old product in cart list
        sending_product_model.Products products =
            sending_product_model.Products(
                productId: event.productId,
                quantity: getProductQuantity(event.cartList, event.productId));
        tempProduct.add(products);
        productSendingModel.setProducts = tempProduct;
        //print(json.encode(productSendingModel));
        final response = await productRepository.updateProductToCart(
            cartId: getCartId(event.cartList, event.productId),
            body: productSendingModel);
      }

      return state.copyWith(
          status: ProductStatus.addToCartSuccess, message: 'success');
    } on Exception {
      return state.copyWith(status: ProductStatus.failure, message: '');
    }
  }

  bool checkNewProduct(List<CartModel> cartList, int productId) {
    for (int i = 0; i < cartList.length; i++) {
      for (int j = 0; j < cartList[i].products!.length; j++) {
        if (cartList[i].products![j].productId == productId) {
          return false;
        }
      }
    }
    return true;
  }

  int getProductQuantity(List<CartModel> cartList, int productId) {
    for (int i = 0; i < cartList.length; i++) {
      for (int j = 0; j < cartList[i].products!.length; j++) {
        if (cartList[i].products![j].productId == productId) {
          return cartList[i].products![j].quantity!;
        }
      }
    }
    return -1;
  }

  int getCartId(List<CartModel> cartList, int productId) {
    for (int i = 0; i < cartList.length; i++) {
      for (int j = 0; j < cartList[i].products!.length; j++) {
        if (cartList[i].products![j].productId == productId) {
          return cartList[i].id!;
        }
      }
    }
    return -1;
  }

  String localDate(String currentDate) {
    if (currentDate.isEmpty) {
      return '';
    } else {
      DateTime tempDate = DateFormat('yyyy-MM-dd').parse(currentDate);
      String date = DateFormat("yyyy-MM-dd").format(tempDate);
      return date;
    }
  }
}
