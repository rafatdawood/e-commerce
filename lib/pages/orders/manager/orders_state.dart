part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class OrdersSuccessState extends OrdersState {}
final class OrdersFailureState extends OrdersState {}
