import 'package:bloc/bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/layout/cubit/states.dart';
import 'package:imaginative_news_app/screens/botomsheet/botomsheet.dart';
import 'package:imaginative_news_app/screens/explore_screen/explore_screen.dart';
import 'package:imaginative_news_app/screens/home_screen/home_screen.dart';
import 'package:imaginative_news_app/screens/notification_sceen/notification_screen.dart';
import 'package:imaginative_news_app/screens/save_screen/save_screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool isBottomSheet = false;


  List<Widget> bottomScreens = [
    HomeScreen(),
    ExploreScreen(),
    LayOutBottomSheet(),
    NotificationScreen(),
    SaveScreen(),
  ];

/*  Align(
  alignment: Alignment.bottomCenter,
  child: BottomSheet(onClosing: (){}, builder: (context)=>Container(
  height: 150,
  width: double.infinity,
  color: Colors.blue,
  )),
  ),*/

  isBottomSheetToggle() {
    isBottomSheet = !isBottomSheet;
    emit(AppChangeBottomSheetState());
  }

  changeBottom(int index) {
    isBottomSheet = false;
    currentIndex = index;
    emit(AppChangeBottomNavigationState());
  }
}
