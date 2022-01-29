import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/authentication_screens/forget_password_screen/forget_password_screen.dart';
import 'package:imaginative_news_app/screens/authentication_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController emailController;

  final TextEditingController passwordController;

  final Function() login;

  const LoginBody(
      {required this.emailController,
      required this.passwordController,
      required this.login,
     });

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return AuthenticationRadius(
        child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        children: [
          ContainerWithShadow(
            child: Column(
              children: [
                LoginTextFormField(
                    controller: emailController,
                    hint: 'Email Address',
                    /*validator: (val) {
                      if (val!.isEmpty) {
                        return 'please enter value';
                      } else {
                        return null;
                      }
                    },*/
                    type: TextInputType.emailAddress),
                Divider(),
                LoginTextFormField(
                    controller: passwordController,
                    hint: 'password',
                   /* validator: (val) {
                      if (val!.isEmpty) {
                        return 'please enter value';
                      } else {
                        return null;
                      }
                    },*/
                    type: TextInputType.visiblePassword,
                    obscure: true),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: BuildCustomTextButton(
                text: 'Forget password?',
                onPressed: () {
                  navigateTo(context, ForgetPasswordScreen());
                },
                color: Colors.black),
          ),
          BuildDefaultButton(
              child: Text(
                'LOGIN',
              ),
              onPressed:
                  login
                ,
              height: size.height * 0.07,
              width: size.width * 0.5),
          SizedBox(
            height: 40,
          ),
          Text('or Login easier using '),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildLoginButtonWithLogo(
                text: 'FaceBook',
                image:
                    'https://www.nicepng.com/png/full/448-4482584_fb-icon-facebook-icon.png',
                color: Colors.lightBlue[900],
              ),
              SizedBox(
                width: 20,
              ),
              BuildLoginButtonWithLogo(
                text: 'Google',
                image:
                    'https://pics.freeicons.io/uploads/icons/png/357916981530077752-512.png',
                color: Colors.orange[900],
              ),
            ],
          )
        ],
      ),
    ));
  }
}

/*
class LoginForm extends StatelessWidget {
  final emailController;

  final passwordController;

  final Function login;

  const LoginForm(
      {this.emailController, this.passwordController, required this.login});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        children: [
          ContainerWithShadow(
            child: Column(
              children: [
                LoginTextFormField(
                    controller: emailController,
                    hint: 'Email Address',
                    type: TextInputType.emailAddress),
                Divider(),
                LoginTextFormField(
                    controller: passwordController,
                    hint: 'password',
                    type: TextInputType.visiblePassword,
                    obscure: true),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: BuildCustomTextButton(
                text: 'Forget password?',
                onPressed: () {
                  navigateTo(context, ForgetPasswordScreen());
                },
                color: Colors.black),
          ),
          BuildDefaultButton(
              child: Text(
                'LOGIN',
              ),
              onPressed: () {},
              height: size.height * 0.07,
              width: size.width * 0.5),
          SizedBox(
            height: 40,
          ),
          Text('or Login easier using '),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildLoginButtonWithLogo(
                text: 'FaceBook',
                image:
                    'https://www.nicepng.com/png/full/448-4482584_fb-icon-facebook-icon.png',
                color: Colors.lightBlue[900],
              ),
              SizedBox(
                width: 20,
              ),
              BuildLoginButtonWithLogo(
                text: 'Google',
                image:
                    'https://pics.freeicons.io/uploads/icons/png/357916981530077752-512.png',
                color: Colors.orange[900],
              ),
            ],
          )
        ],
      ),
    );
  }
}
*/
