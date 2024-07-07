import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool showPassword = true;

  login({required email, required password}) async{
    final response = await AppDio.post(
        endpoint: EndPoints.login,
        body: {'email': email, 'password': password});
      if (response.data['status']) {
        emit(LoginSuccessState(response.data['message']));
        PreferenceUtils.setBool(PrefKeys.loggedIn, true);
        PreferenceUtils.setString(PrefKeys.apiToken, response.data['data']['token']);
      } else {
        emit(LoginFailureState(response.data['message']));
      }
      print(PreferenceUtils.getString(PrefKeys.apiToken));
      print(PreferenceUtils.getBool(PrefKeys.loggedIn));
      print(PreferenceUtils.getString(PrefKeys.language));
  }

  togglePassword() {
    showPassword = !showPassword;
    emit(LoginRefresh());
  }
}
