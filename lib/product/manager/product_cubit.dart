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

  getData(){
    AppDio.get(endpoint: '${EndPoints.categoriesProd}/$id').then((val){
      productData['data']=val.data['data'];
      emit(ProductSuccessState());
    });
  }

  addToCard(id){
    AppDio.post(endpoint: EndPoints.cart,body: {'product_id':id}).then((val){
     emit(ProductAddSuccess(val.data['message']));
     emit(ProductSuccessState());
    });
  }


  showImages(index){
    activeIndex = index;
    emit(ProductRefresh());
    emit(ProductSuccessState());
  }
}
