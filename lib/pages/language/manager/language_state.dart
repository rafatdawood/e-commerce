part of 'language_cubit.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}
final class LanguageChangeSuccess extends LanguageState {}
final class LanguageChangeFailure extends LanguageState {}
