import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'details_Screens_states.dart';

class DetailsScreensCubit extends Cubit<DetailsScreensState> {


  bool isMute = false;

  void changeMuteValue(){
    isMute = !isMute;
    emit(ChangeMuteState());
  }





  DetailsScreensCubit() : super(DetailsScreensInitialState());

  static DetailsScreensCubit get(context) => BlocProvider.of(context);
  List<String> images = [
    'https://image.freepik.com/free-psd/arrangement-minimal-coffee-mugs_23-2149027126.jpg',
    'https://image.freepik.com/free-psd/arrangement-minimal-coffee-mugs_23-2149027129.jpg',
    'https://image.freepik.com/free-psd/assortment-minimal-coffee-mugs_23-2149027142.jpg',
  ];




  int currentIndex = 0;


  bool descriptionSeeLess = false;
  void changeDescriptionSeeLess(){
    descriptionSeeLess = !descriptionSeeLess;
    emit(ChangeDescriptionSeeLessState());
  }

  bool storySeeLess = false;
  void changeStorySeeLess(){
    storySeeLess = !storySeeLess;
    emit(ChangeStorySeeLessState());
  }
  bool credentialsSeeLess = false;
  void changeCredentialsSeeLess(){
    credentialsSeeLess = !credentialsSeeLess;
    emit(ChangeCredentialsSeeLessState());
  }
  bool advantagesSeeLess = false;
  void changeAdvantagesSeeLess(){
    advantagesSeeLess = !advantagesSeeLess;
    emit(ChangeAdvantagesSeeLessState());
  }
  bool usesSeeLess = false;
  void changeUsesSeeLess(){
    usesSeeLess = !usesSeeLess;
    emit(ChangeUsesSeeLessState());
  }
  bool offerDetailsSeeLess = false;
  void changeOfferDetailsSeeLess(){
    offerDetailsSeeLess = !offerDetailsSeeLess;
    emit(ChangeOfferDetailsSeeLessState());
  }


  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
