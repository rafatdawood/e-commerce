import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/store_app_dio.dart';
import 'package:e_commerce/core/store_app_endpoints.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int activeIndex = 0;
  Map productsAndBanners = {
    'data': {},
  };
  Map categories = {
    'data': {},
  };


  Future<void> getCategories() async {
    final response = await AppDio.get(endpoint: EndPoints.categories);
    categories['data'] = response.data['data'];
  }

  Future<void> getProductsAndBanners() async {
    final response = await AppDio.get(endpoint: EndPoints.home);
    productsAndBanners['data'] = response.data['data'];
  }

  Future<void> getAllData() async {
    await getCategories();
    await getProductsAndBanners();
    emit(HomeSuccessState());
  }

  Future<void> removeOrAdd(String id, int index) async {
    final response = await AppDio.post(
        endpoint: EndPoints.getFavorites, body: {'product_id': id});
    if(response.data['status']){
      productsAndBanners['data']['products'][index]['in_favorites'] =
      !productsAndBanners['data']['products'][index]['in_favorites'];
      emit(HomeAddOrRemove(response.data['message']));
    }else{
      emit(HomeAddOrRemoveFailure(response.data['message']));
    }
    emit(HomeSuccessState());
  }

  edit(res){
    for(int i=0 ;i < res.length;i++){
      int x = productsAndBanners['data']['products'].indexWhere((e)=> e['id'] == res[i]['id']);
      productsAndBanners['data']['products'][x]['in_favorites'] = res[i]['in_favorites'];
    }
    emit(HomeSuccessState());
  }

  showImages(index) {
    activeIndex = index;
    emit(HomeSuccessState());
  }
}
