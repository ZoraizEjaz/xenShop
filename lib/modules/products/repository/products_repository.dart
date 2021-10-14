import 'package:xenshop/modules/products/data_source/products_data_source.dart';

class ProductRepository {
  ProductsDataSource productsDataSource;
  ProductRepository({required this.productsDataSource});

  Future<dynamic> getProductsByCategoryType({required String categoryType}) async {
    return await productsDataSource.getProductsByCategoryType(categoryType: categoryType);
  }

  Future<dynamic> addProductToCart({required Object body}) async {
    return await productsDataSource.addProductToCart(body: body);
  }

  Future<dynamic> updateProductToCart({required int cartId, required Object body}) async {
    return await productsDataSource.updateProductToCart(cartId: cartId, body: body);
  }
}
