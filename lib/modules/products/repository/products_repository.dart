import 'package:xenshop/modules/products/data_source/products_data_source.dart';

class ProductRepository {
  ProductsDataSource productsDataSource;
  ProductRepository({required this.productsDataSource});

  Future<dynamic> getProductsByCategoryType({required String categoryType}) async {
    return await productsDataSource.getProductsByCategoryType(categoryType: categoryType);
  }

}
