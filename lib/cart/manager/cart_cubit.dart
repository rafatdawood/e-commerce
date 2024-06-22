import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/sheard.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Map cartsList = {
    'data':{'cart_items':[]}
  };

  getData() {
    AppDio.get(endpoint: EndPoints.cart).then((val){
      cartsList['data']=val.data['data'];
      emit(CartSuccessState());
    });
  }
  deleteItem(String id){
    AppDio.delete(endpoint: '${EndPoints.cart}/$id').then((val){
      emit(CartDeleteSuccess(val.data['message']));
      getData();
    });
  }
  increaseQuantity(String id,int quantity){
    AppDio.put(endpoint: '${EndPoints.cart}/$id',body: {'quantity':quantity += 1}).then((val){
      emit(CartCounter(val.data['message']));
      getData();
    });
  }
  decreaseQuantity(String id,int quantity){
    AppDio.put(endpoint: '${EndPoints.cart}/$id',body: {'quantity':quantity -= 1}).then((val){
      emit(CartCounter(val.data['message']));
      getData();
    });
  }
}
