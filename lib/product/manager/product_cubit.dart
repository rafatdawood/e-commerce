import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  int activeIndex = 0;
  Map productData = {
    'data':{}
  };
  String id = '';
  List data = [];

  Future<void>getData()async{
    final response = await AppDio.get(endpoint: '${EndPoints.categoriesProd}/$id');
      productData['data']=response.data['data'];
      emit(ProductSuccessState());
  }

  Future<void>addToCard(id)async{
    final response = await AppDio.post(endpoint: EndPoints.cart,body: {'product_id':id});
     emit(ProductAddSuccess(response.data['message']));
  }

  Future<void>removeOrAdd(String id)async{
    final response = await AppDio.post(endpoint: EndPoints.getFavorites,body: {'product_id':id});
    if(response.data['status']){
      productData['data']['in_favorites'] =
      !productData['data']['in_favorites'];
      data.add({'id':int.parse(id),'in_favorites':productData['data']['in_favorites']});
      emit(ProductAddSuccess(response.data['message']));
    }
    emit(ProductSuccessState());
  }


  showImages(index){
    activeIndex = index;
    emit(ProductRefresh());
    emit(ProductSuccessState());
  }
}
