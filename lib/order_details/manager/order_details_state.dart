part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}
final class OrderDetailsSuccessState extends OrderDetailsState {}
final class OrderDetailsCancelSuccessState extends OrderDetailsState {
  final String message;

  OrderDetailsCancelSuccessState(this.message);
}
final class OrderDetailsCancelFailureState extends OrderDetailsState {}
