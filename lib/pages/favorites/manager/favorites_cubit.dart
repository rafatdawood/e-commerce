import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  final Map wishList = {
    "data": {
      "data": [
      ],
    }
  };

  Future<void> getData() async{
    final response = await AppDio.get(endpoint: EndPoints.getFavorites);
      wishList['data'] =response.data['data'];
      emit(FavoritesSuccessState());
  }
  Future<void>delete(id,index)async{
    final response = await AppDio.delete(endpoint: '${EndPoints.getFavorites}/$id');
    if(response.data['status']){
      wishList['data']['data'].removeAt(index);
      emit(FavoritesDelete(response.data['message']));
    }else{
      emit(FavoritesDeleteFailure(response.data['message']));
    }
    emit(FavoritesSuccessState());

  }
  Future<void>addToCart(id)async{
    final response = await AppDio.post(endpoint: EndPoints.cart,body: {'product_id':id});
    emit(FavoritesAddSuccess(response.data['message']));
  }
}
