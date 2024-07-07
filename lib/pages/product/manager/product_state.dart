part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductRefresh extends ProductState {}
final class ProductAddSuccess extends ProductState {
  final String massage;

  ProductAddSuccess(this.massage);
}
final class ProductSuccessState extends ProductState {}
final class ProductFailureState extends ProductState {}
