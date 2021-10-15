import 'package:xenshop/constants/api_paths_constants.dart';
import 'package:xenshop/utils/services/networking/api_provider.dart';

class CategoryDatasource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<dynamic> getCategories() async {
    final response = await _apiProvider.get(url: productCategories);
    return response;
  }

}
