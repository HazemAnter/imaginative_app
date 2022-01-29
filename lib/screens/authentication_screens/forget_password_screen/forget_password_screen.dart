import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/authentication_screens/forget_password_screen/forget_password_cubit/forget_password_States.dart';
import 'package:imaginative_news_app/screens/authentication_screens/forget_password_screen/forget_password_cubit/forget_password_cubit.dart';
import 'package:imaginative_news_app/screens/authentication_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();
 final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return BlocProvider(
      create: (BuildContext context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ForgetPasswordCubit.get(context);
          return Scaffold(
            appBar: BuildAppBarWithCenterTitle(
              title: 'Forget Password',
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthenticationHeader(),
                    ForgetPasswordBody(
                      emailController: emailController,
                      sendCode: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          cubit.forgetPassword(
                              body: {'email': emailController.text});
                        }
                      },
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
