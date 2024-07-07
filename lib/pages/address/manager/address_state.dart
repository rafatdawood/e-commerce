part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}
final class AddressSuccessState extends AddressState {}
final class AddressFailureState extends AddressState {}
final class AddressDeleteSuccessState extends AddressState {
  final String massage;

  AddressDeleteSuccessState(this.massage);
}
final class AddressDeleteFailureState extends AddressState {
  final String errorMassage;

  AddressDeleteFailureState(this.errorMassage);
}
