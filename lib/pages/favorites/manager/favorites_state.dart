part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesAddSuccess extends FavoritesState {
  final String message;

  FavoritesAddSuccess(this.message);
}
final class FavoritesSuccessState extends FavoritesState {}
final class FavoritesFailureState extends FavoritesState {}
final class FavoritesDelete extends FavoritesState {
  final String message;
  FavoritesDelete(this.message);
}
final class FavoritesDeleteFailure extends FavoritesState {
  final String message;
  FavoritesDeleteFailure(this.message);
}
