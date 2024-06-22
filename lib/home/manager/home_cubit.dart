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

  getAllData() {
    AppDio.get(endpoint: EndPoints.categories).then((val) {
      categories['data'] = val.data['data'];
      AppDio.get(endpoint: EndPoints.home).then((val) {
        productsAndBanners['data'] = val.data['data'];
        emit(HomeSuccessState());
      });
    });

  }

  showImages(index) {
    activeIndex = index;
  }
}
