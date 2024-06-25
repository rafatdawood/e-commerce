import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Map cartsList = {
    'data': {'cart_items': []}
  };
  Map addresses = {
    'data': {'data': []}
  };
  List payment = [
    {'id': 1, 'name': "Cash"},
    {'id': 2, 'name': "Online"},
  ];
  int paymentIndex = 0;
  int addressesIndex = 0;

  Future<void> getData() async {
    await getCartData();
    await getAddress();
    emit(CartSuccessState());
  }

  Future<void> getCartData() async {
    final response = await AppDio.get(endpoint: EndPoints.cart);
    cartsList['data'] = response.data['data'];
  }

  Future<void> deleteItem(String id, index) async {
    final response = await AppDio.delete(endpoint: '${EndPoints.cart}/$id');
    if (response.data['status']) {
      cartsList['data']['total'] -= (cartsList['data']['cart_items'][index]
              ['product']['price'] *
          cartsList['data']['cart_items'][index]['quantity']);
      cartsList['data']['cart_items'].removeAt(index);
      emit(CartDeleteSuccess(response.data['message']));
    } else {
      emit(CartDeleteFailure(response.data['message']));
    }
    emit(CartSuccessState());
  }

  Future<void> increaseQuantity(String id, int quantity, index) async {
    final response = await AppDio.put(
        endpoint: '${EndPoints.cart}/$id', body: {'quantity': quantity += 1});
    if (response.data['status']) {
      cartsList['data']['total'] +=
          cartsList['data']['cart_items'][index]['product']['price'];
      cartsList['data']['cart_items'][index]['quantity'] += 1;
      emit(CartCounter(response.data['message']));
    } else {
      emit(CartCounterFailure(response.data['message']));
    }
    emit(CartSuccessState());
  }

  Future<void> decreaseQuantity(String id, int quantity, index) async {
    final response = await AppDio.put(
        endpoint: '${EndPoints.cart}/$id', body: {'quantity': quantity -= 1});
    if (response.data['status']) {
      cartsList['data']['total'] -=
          cartsList['data']['cart_items'][index]['product']['price'];
      cartsList['data']['cart_items'][index]['quantity'] -= 1;
      emit(CartCounter(response.data['message']));
    } else {
      emit(CartCounterFailure(response.data['message']));
    }
    emit(CartSuccessState());
  }

  Future<void> getAddress() async {
    final response = await AppDio.get(endpoint: EndPoints.addresses);
    addresses['data'] = response.data['data'];
  }

  Future<void> buyNow() async {
    final response = await AppDio.post(endpoint: EndPoints.orders, body: {
      'address_id': addresses['data']['data'][addressesIndex]['id'],
      'payment_method': payment[paymentIndex]['id'],
      'use_points': false,
    });
    if(response.data['status']){
      cartsList['data']['cart_items'] = [];
      emit(CartAddOrderSuccess(response.data['message']));
    }
    emit(CartSuccessState());
  }

  edit(res) {
    addresses['data']['data'].add(res['data']);
    emit(CartSuccessState());
  }

  editAddressesIndex(index) {
    paymentIndex = index;
    emit(CartSuccessState());
  }
}
