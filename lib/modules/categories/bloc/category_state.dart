part of 'category_bloc.dart';

enum CategoryStatus { initial, loading, success, failure }

class CategoryState extends Equatable {
  final CategoryStatus status;
  final String message;
  final List<String> categories;

  const CategoryState(
      {this.status = CategoryStatus.initial,
      this.message = '',
      this.categories = const <String>[]});

  CategoryState copyWith({
    CategoryStatus? status,
    String? message,
    List<String>? categories,
  }) {
    return CategoryState(
      status: status ?? this.status,
      message: message ?? this.message,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [status, message, categories];
}
