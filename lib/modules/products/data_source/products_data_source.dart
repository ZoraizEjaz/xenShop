import 'package:xenshop/constants/api_paths_constants.dart';
import 'package:xenshop/utils/services/networking/api_provider.dart';

class ProductsDataSource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<dynamic> getProductsByCategoryType({required String categoryType}) async {
    final response = await _apiProvider.get(url: products + "/" + category + '/' + categoryType);
    return response;
  }

}
