import 'package:xenshop/constants/api_paths_constants.dart';
import 'package:xenshop/constants/app_constants.dart';
import 'package:xenshop/utils/services/networking/api_provider.dart';

class CartDataSource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<dynamic> getUserCartData() async {
    final response = await _apiProvider.get(url: userCartData + '/'+ userId.toString());
    return response;
  }

  Future<dynamic> getAllProductsList() async {
    final response = await _apiProvider.get(url: products);
    return response;
  }

  Future<dynamic> removeProductFromCart({required int cartId}) async {
    final response = await _apiProvider.delete(url: cart + '/' + cartId.toString());
    return response;
  }

}
