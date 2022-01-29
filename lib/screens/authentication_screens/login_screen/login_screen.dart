import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/authentication_screens/login_screen/login_cubit/login_cubit.dart';
import 'package:imaginative_news_app/screens/authentication_screens/login_screen/widget/widgete.dart';
import 'package:imaginative_news_app/screens/authentication_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

import 'login_cubit/login_States.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 3,
              shadowColor: Colors.white,
              title: Text(
                'LOGIN',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    AuthenticationHeader(),
                    LoginBody(
                      login: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          cubit.login({
                            'email': emailController.text,
                            'password': passwordController.text
                          });
                        }
                      },
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
