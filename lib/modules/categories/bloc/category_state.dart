part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, success, failure }

class CategoryState extends Equatable {
  final CategoryStatus status;
  final String message;
  final String selectedCatName;
  final List<String> categories;

  const CategoryState(
      {this.status = CategoryStatus.initial,
      this.message = '',
        this.selectedCatName = '',
      this.categories = const <String>[]});

  CategoryState copyWith({
    CategoryStatus? status,
    String? message,
    String? selectedCatName,
    List<String>? categories,
  }) {
    return CategoryState(
      status: status ?? this.status,
      message: message ?? this.message,
      selectedCatName: selectedCatName ?? this.selectedCatName,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [status, message, selectedCatName ,categories];
}
