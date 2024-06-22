import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool showPassword = true;

  login({required email, required password}) {
    AppDio.post(
        endpoint: EndPoints.login,
        body: {'email': email, 'password': password}).then((value) {
      if (value.data['status']) {
        emit(LoginSuccessState(value.data['message']));
        PreferenceUtils.setBool(PrefKeys.loggedIn, true);
        PreferenceUtils.setString(PrefKeys.apiToken, value.data['data']['token']);
        print(PreferenceUtils.getString(PrefKeys.apiToken));
      } else {
        emit(LoginFailureState(value.data['message']));
      }
    });
  }

  togglePassword() {
    showPassword = !showPassword;
    emit(LoginRefresh());
  }
}
