part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginRefresh extends LoginState {}
final class LoginSuccessState extends LoginState {
  final String massage;

  LoginSuccessState(this.massage);
}
final class LoginFailureState extends LoginState {
  final String errorMassage;

  LoginFailureState(this.errorMassage);
}
