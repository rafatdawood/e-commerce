part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileSuccessState extends ProfileState {}
final class ProfileFailureState extends ProfileState {}
final class ProfileEditSuccessState extends ProfileState {
  final String massage;

  ProfileEditSuccessState(this.massage);
}
final class ProfileEditFailureState extends ProfileState {
  final String errorMassage;

  ProfileEditFailureState(this.errorMassage);
}

