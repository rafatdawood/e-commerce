import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  Map addressData = {
    "data": {
      "data": [],
    }
  };

  Future<void> getData() async {
    final response = await AppDio.get(endpoint: EndPoints.addresses);
    addressData['data']['data'] = response.data['data']['data'];
    emit(AddressSuccessState());
  }

  Future<void> deleteAddress(index) async {
    final response = await AppDio.delete(endpoint: '${EndPoints
        .addresses}/${addressData['data']['data'][index]['id']}');
    if(response.data['status']){
      emit(AddressDeleteSuccessState(response.data['message']));
      addressData['data']['data'].removeAt(index);
    }else{
      emit(AddressDeleteFailureState(response.data['message']));
    }
    emit(AddressSuccessState());
  }

  addAddress(data){
    addressData['data']['data'].add(data);
    emit(AddressSuccessState());
  }
}
