part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategorySuccessState extends CategoryState {}
final class CategoryFailureState extends CategoryState {}
