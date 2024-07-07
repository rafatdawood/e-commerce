import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  String id = '';
  Map categoryDetails = {"data": {}};
  List data = [];

  Future<void>getData() async {
    final response = await AppDio.get(
        endpoint: EndPoints.categoriesProd,
        queryParameters: {'category_id': id});
    categoryDetails['data'] = response.data['data'];
    emit(CategorySuccessState());
  }

  Future<void>removeOrAdd(String id,int index) async {
    final response = await AppDio.post(
        endpoint: EndPoints.getFavorites, body: {'product_id': id});
    if(response.data['status']){
      categoryDetails['data']['data'][index]['in_favorites'] =
      !categoryDetails['data']['data'][index]['in_favorites'];
      data.add({'id':int.parse(id),'in_favorites':categoryDetails['data']['data'][index]['in_favorites']});
      emit(CategoryAddOrRemove(response.data['message']));
    }
    emit(CategorySuccessState());
  }

  edit(res){
    data=res;
    for(int i=0 ;i < res.length;i++){
      int x = categoryDetails['data']['data'].indexWhere((e)=> e['id'] == res[i]['id']);
      categoryDetails['data']['data'][x]['in_favorites'] = res[i]['in_favorites'];
    }
    emit(CategorySuccessState());
  }
}
