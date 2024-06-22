import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/store_app_dio.dart';
import '../../core/store_app_endpoints.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());
  bool showPassword = true;

  register({
    required name,
    required email,
    required password,
    required phone,
  }) {
    AppDio.post(endpoint: EndPoints.register, body: {
      'name': name,
      'password': password,
      'email': email,
      'phone': phone,
    }).then(
          (value) {
        if (value.data['status']) {
          emit(CreateAccountSuccessState(value.data["message"]));
        } else {
          emit(CreateAccountFailureState(value.data["message"]));
        }
      },
    );
  }

  togglePassword() {
    showPassword = !showPassword;
    emit(CreateAccountRefresh());
  }
}
