import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'edit_address_state.dart';

class EditAddressCubit extends Cubit<EditAddressState> {
  EditAddressCubit() : super(EditAddressInitial());
  int id = 0;
  Map data = {};

  Future<void> editAddress(
      {required int id,
      required String name,
      required String city,
      required String details,
      required String notes,
      required String region}) async {
    final response =
        await AppDio.put(endpoint: '${EndPoints.addresses}/$id', body: {
      "name": name,
      "city": city,
      "region": region,
      "details": details,
      "latitude": 0,
      "longitude": 0,
      "notes": notes
    });
    if (response.data['status']) {
      data = {
        'id': id,
        "name": name,
        "city": city,
        "region": region,
        "details": details,
        "latitude": 0,
        "longitude": 0,
        "notes": notes
      };
      emit(EditAddressEditSuccessState(response.data['message']));
    } else {
      emit(EditAddressEditFailureState(response.data['message']));
    }
    emit(EditAddressSuccessState());
  }
}
