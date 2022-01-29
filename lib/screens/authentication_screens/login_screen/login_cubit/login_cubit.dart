import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/models/login_mdel.dart';
import 'package:imaginative_news_app/screens/authentication_screens/login_screen/login_cubit/login_States.dart';
import 'package:imaginative_news_app/shared/network/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=> BlocProvider.of(context);
  UserModel userModel = UserModel() ;
  login(var body) {
    emit(LoginLoadingState());
    DioHelper.post('login', body)
        .then((value){
      print('eshta');
      print(value.data);
      if(value.data['success']){
        print(value.data);
        userModel=UserModel.fromJson(value.data);
        emit(LoginSuccessState());
      print('done');}
      else{
        print(value.data['message']);
        emit(LoginErrorState());
      }
    }).catchError((error) {
      print('msh eshta');
      print(error);
      emit(LoginErrorState());
    });
  }
}
