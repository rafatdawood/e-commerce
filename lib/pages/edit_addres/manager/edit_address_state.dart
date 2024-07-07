part of 'edit_address_cubit.dart';

@immutable
sealed class EditAddressState {}

final class EditAddressInitial extends EditAddressState {}
final class EditAddressSuccessState extends EditAddressState {}
final class EditAddressFailureState extends EditAddressState {}
final class EditAddressEditFailureState extends EditAddressState {
  final String errorMassage;

  EditAddressEditFailureState(this.errorMassage);
}
final class EditAddressEditSuccessState extends EditAddressState {
  final String massage;

  EditAddressEditSuccessState(this.massage);
}
