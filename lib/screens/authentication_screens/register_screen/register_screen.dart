import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/authentication_screens/register_screen/register_screen_cubit/register_screen_cubit.dart';
import 'package:imaginative_news_app/screens/authentication_screens/register_screen/register_screen_cubit/register_screen_states.dart';
import 'package:imaginative_news_app/screens/authentication_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  final  nameController = TextEditingController();
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
       return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var size = getSize(context);
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthenticationHeader(),
                    RegisterBody(
                      register: () {
                        print(nameController.text);
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          cubit.userRegister({
                            'name': nameController.text,
                            'email': emailController.text,
                            'password': passwordController.text,
                            'notificationsEnabled': true,
                            'type': 'individual',
                            'lang': 'en'
                          });
                        }
                      },
                      passwordController: passwordController,
                      emailController: emailController,
                      nameController: nameController,
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
