import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());

  int activeIndex = 0;
  List images = [
    {
      'image': 'assets/images/welcome_1.jpg',
      'title': 'Hello',
      'contact':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
      'pt': false
    },
    {
      'image': 'assets/images/welcome_2.jpg',
      'title': 'Ready?',
      'contact': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'pt': true
    },
  ];

  slideImages(index){
    activeIndex = index;
    emit(WelcomeRefresh());
  }
}
