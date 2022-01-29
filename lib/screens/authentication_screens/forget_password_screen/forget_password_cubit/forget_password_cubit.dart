import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/shared/network/dio_helper.dart';

import 'forget_password_States.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  forgetPassword({required var body}) {
    emit(ForgetPasswordLoadingState());
    DioHelper.post('forgot-password', body).then((value) {
      print('success.............');
      print(value.data);
      if (value.data['success']) {
        print(value.data);
        emit(ForgetPasswordSuccessState());
        print('done');
      } else {
        print(value.data['message']);
        emit(ForgetPasswordErrorState());
      }
    }).catchError((error) {
      print('exception..............');
      print(error);
      emit(ForgetPasswordErrorState());
    });
  }
}
