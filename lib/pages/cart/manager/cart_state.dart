part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartAddOrderSuccess extends CartState {
  final String message;

  CartAddOrderSuccess(this.message);
}
final class CartAddOrderFailure extends CartState {
  final String message;

  CartAddOrderFailure(this.message);
}
final class CartCounterFailure extends CartState {
  final String message;

  CartCounterFailure(this.message);
}
final class CartDeleteFailure extends CartState {
  final String message;

  CartDeleteFailure(this.message);
}
final class CartDeleteSuccess extends CartState {
  final String massage;

  CartDeleteSuccess(this.massage);
}
final class CartCounter extends CartState {
  final String message;

  CartCounter(this.message);
}
final class CartSuccessState extends CartState {}
final class CartFailureState extends CartState {}
