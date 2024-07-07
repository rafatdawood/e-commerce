import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future<void> getData()async{
    final response = await AppDio.get(endpoint: EndPoints.profile);
    email.text = response.data['data']['email'];
    name.text = response.data['data']['name'];
    phone.text = response.data['data']['phone'];
    emit(ProfileSuccessState());
  }
  
  Future<void> saveChanges()async{
    final response = await AppDio.put(endpoint: EndPoints.updateProfile,body: {
      "name": name.text,
      "phone": phone.text,
      "email":email.text,
    });
    if(response.data['status']){
      emit(ProfileEditSuccessState(response.data['message']));
    }else{
      emit(ProfileEditFailureState(response.data['message']));
    }
    emit(ProfileSuccessState());
  }
}
