

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  String id = '';
  Map categoryDetails = {
    "data": {}
  };
  
  getData(){
    AppDio.get(endpoint: EndPoints.categoriesProd,queryParameters: {'category_id':id}).then((val){
      categoryDetails['data'] = val.data['data'];
      emit(CategorySuccessState());
    });
  }
}
