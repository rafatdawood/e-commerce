import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/sheard.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  String language = PreferenceUtils.getString(PrefKeys.language);

  Future<void>changeLanguage(value)async{
      language = value;
      await PreferenceUtils.setString(PrefKeys.language, value);
      emit(LanguageChangeSuccess());
  }

}
