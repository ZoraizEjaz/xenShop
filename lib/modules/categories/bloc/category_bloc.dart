import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenshop/modules/categories/repository/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.categoryRepository}) : super(const CategoryState());
  CategoryRepository categoryRepository;

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if(event is FetchCategories){
      yield await mapSearchFieldsToState(state, event);
    }
  }

  Future<CategoryState> mapSearchFieldsToState(CategoryState state, CategoryEvent event) async {
    try{
      final response = await categoryRepository.getCategories();
      List<String> catList = List<String>.from(response);
      return state.copyWith(
          status: CategoryStatus.success,
          categories: catList,
          message: 'success'
      );
    }on Exception{
      return state.copyWith(
          status: CategoryStatus.failure,
          message: ''
      );
    }
  }
}
