part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}
final class CreateAccountRefresh extends CreateAccountState {}
final class CreateAccountSuccessState extends CreateAccountState {
  final String massage;

  CreateAccountSuccessState(this.massage);
}
final class CreateAccountFailureState extends CreateAccountState {
  final String errorMassage;

  CreateAccountFailureState(this.errorMassage);
}
