import 'package:xenshop/modules/shopping_cart/data_source/cart_data_source.dart';

class CartRepository {
  CartDataSource cartDataSource;
  CartRepository({required this.cartDataSource});

  Future<dynamic> getUserCartData() async {
    return await cartDataSource.getUserCartData();
  }

  Future<dynamic> getAllProductList() async {
    return await cartDataSource.getAllProductsList();
  }

}
