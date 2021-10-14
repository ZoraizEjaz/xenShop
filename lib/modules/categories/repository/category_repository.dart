import 'package:xenshop/modules/categories/data_source/category_data_source.dart';

class CategoryRepository {
  CategoryDatasource categoryDatasource;
  CategoryRepository({required this.categoryDatasource});

  Future<dynamic> getCategories() async {
    return await categoryDatasource.getCategories();
  }

}
