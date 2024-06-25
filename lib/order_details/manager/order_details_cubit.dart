import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());

  Map orderDetails = {
    "data": {}
  };
  List tracking = [
    {'title': 'Order Placed', 'value': 'new'},
    {'title': 'Packed', 'value': 'Packed'},
    {'title': 'Shipped', 'value': 'Shipped'},
    {'title': 'Delivered', 'value': 'Delivered'}
  ];
  int id = 0;
  Map data = {};
  
  Future<void> getData()async{
    final response = await AppDio.get(endpoint: "${EndPoints.orders}/$id");
    orderDetails['data'] = response.data['data'];
    emit(OrderDetailsSuccessState());
  }

  Future<void> cancelOrder()async{
    final response =await AppDio.get(endpoint: '${EndPoints.orders}/${orderDetails['data']['id']}/cancel');
    if(response.data['status']){
      orderDetails['data']['status'] = 'Cancelled';
      data.addAll({'id':orderDetails['data']['id'],'status':'Cancelled'});
      emit(OrderDetailsCancelSuccessState(response.data['message']));
    }
    emit(OrderDetailsSuccessState());
  }
}
