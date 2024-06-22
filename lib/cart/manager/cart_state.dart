part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartDeleteSuccess extends CartState {
  final String massage;

  CartDeleteSuccess(this.massage);
}
final class CartCounter extends CartState {
  final String massage;

  CartCounter(this.massage);
}
final class CartSuccessState extends CartState {}
final class CartFailureState extends CartState {}
