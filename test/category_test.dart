import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xenshop/modules/categories/bloc/category_bloc.dart';
import 'package:xenshop/modules/categories/data_source/category_data_source.dart';
import 'package:xenshop/modules/categories/repository/category_repository.dart';

void main() {
  group('CategoryBloc Test', () {
    CategoryBloc categoryBloc = CategoryBloc(
        categoryRepository:
            CategoryRepository(categoryDatasource: CategoryDatasource()));
    blocTest<CategoryBloc, CategoryState>(
        'emits success receive data via network',
        build: () => categoryBloc,
        act: (CategoryBloc) => categoryBloc.add(FetchCategories()),
        expect: () => [
              const CategoryState(
                  status: CategoryStatus.success,
                  message: "success",
                  selectedCatName: "",
                categories: ["electronics", "jewelery", "men's clothing", "women's clothing"]
              ),
              const CategoryState(
                  status: CategoryStatus.success,
                  message: "success",
                  selectedCatName: "",
                  categories: ["electronics", "jewelery", "men's clothing", "women's clothing"]
              )
            ]);
  });
}
