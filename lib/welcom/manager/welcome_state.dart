part of 'welcome_cubit.dart';

@immutable
sealed class WelcomeState {}

final class WelcomeInitial extends WelcomeState {}
final class WelcomeRefresh extends WelcomeState {}
final class WelcomeSuccessState extends WelcomeState {}
final class WelcomeFailureState extends WelcomeState {}
