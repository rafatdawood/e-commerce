part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeRefresh extends HomeState {}
final class HomeAddOrRemoveFailure extends HomeState {
  final String message;

  HomeAddOrRemoveFailure(this.message);
}
final class HomeAddOrRemove extends HomeState {
  final String massage;

  HomeAddOrRemove(this.massage);

}
final class HomeSuccessState extends HomeState {}
final class HomeFailureState extends HomeState {}
