part of 'category_bloc.dart';

class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCategories extends CategoryEvent {}

class AddSelectedCategoryIndex extends CategoryEvent {
  final String selectedCatName;
  AddSelectedCategoryIndex({required this.selectedCatName});

  @override
  List<Object?> get props => [selectedCatName];
}