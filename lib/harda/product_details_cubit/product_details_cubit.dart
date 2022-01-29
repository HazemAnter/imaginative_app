/*
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/harda/product_details_cubit/product_details_states.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitialState());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  List<String> images = [
    'https://image.freepik.com/free-psd/arrangement-minimal-coffee-mugs_23-2149027126.jpg',
    'https://image.freepik.com/free-psd/arrangement-minimal-coffee-mugs_23-2149027129.jpg',
    'https://image.freepik.com/free-psd/assortment-minimal-coffee-mugs_23-2149027142.jpg',
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
  bool descriptionSeeLess = true;
  void changeDescriptionSeeLess(){
    descriptionSeeLess = !descriptionSeeLess;
    emit(ChangeDescriptionSeeLessState());
  }
  bool credentialsSeeLess = true;
  void changeCredentialsSeeLess(){
    credentialsSeeLess = !credentialsSeeLess;
    emit(ChangeCredentialsSeeLessState());
  }
  bool advantagesSeeLess = true;
  void changeAdvantagesSeeLess(){
    advantagesSeeLess = !advantagesSeeLess;
    emit(ChangeAdvantagesSeeLessState());
  }
  bool usesSeeLess = true;
  void changeUsesSeeLess(){
    usesSeeLess = !usesSeeLess;
    emit(ChangeUsesSeeLessState());
  }
  bool offerDetailsSeeLess = true;
  void changeOfferDetailsSeeLess(){
    offerDetailsSeeLess = !offerDetailsSeeLess;
    emit(ChangeOfferDetailsSeeLessState());
  }
}
*/
