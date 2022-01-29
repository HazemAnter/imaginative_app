import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/models/login_mdel.dart';
import 'package:imaginative_news_app/screens/authentication_screens/register_screen/register_screen_cubit/register_screen_states.dart';
import 'package:imaginative_news_app/shared/network/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel userModel = UserModel();

  userRegister(var body) {
    print('register<<<<<<<<<<<<<<<<<<<<<<<<<');
    print(body);

    emit(RegisterLoadingState());
    DioHelper.post('register', body).then((value) {
      print('success<<<<<<<<<<<<<<<<<<<<<<<<<');
      if (value.data['success']) {
        print(value.data);
        userModel = UserModel.fromJson(value.data);
        emit(RegisterSuccessState());
        print('done');

    } else {
        print(value.data['message']);
        emit(RegisterErrorState(value.data['message']));
      }
    }).catchError((error) {
      print('Exception<<<<<<<<<<<<<<<<<<<<<<<<<');
      print(error);
      emit(RegisterErrorState(error));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }
}
