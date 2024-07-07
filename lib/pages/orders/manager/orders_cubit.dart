import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  Map ordersData = {
    "data": {"data": []}
  };

  Future<void>getData()async{
    final response = await AppDio.get(endpoint: EndPoints.orders);
    ordersData['data'] = response.data['data'];
    emit(OrdersSuccessState());
  }
  edit(response){
    int x = ordersData['data']['data'].indexWhere((e)=> e['id'] == response['id']);
    ordersData['data']['data'][x]['status'] = response['status'];
    emit(OrdersSuccessState());
  }
}
