import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/authentication_screens/forget_password_screen/forget_password_cubit/forget_password_cubit.dart';
import 'package:imaginative_news_app/screens/authentication_screens/forget_password_screen/forget_password_screen.dart';
import 'package:imaginative_news_app/screens/authentication_screens/login_screen/login_screen.dart';
import 'package:imaginative_news_app/screens/authentication_screens/register_screen/register_screen_cubit/register_screen_cubit.dart';
import 'package:imaginative_news_app/screens/authentication_screens/register_screen/register_screen_cubit/register_screen_states.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:imaginative_news_app/layout/layout.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';
import 'package:dio/dio.dart';

class AuthenticationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return Container(
      height: size.height * 0.15,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30),
        child: Row(
          children: [
            Icon(
              Icons.print,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'imaginative news',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController passwordController;

  const RegisterForm(
      {required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        children: [
          RegisterFormFields(
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController,
          ),
          RegisterButtons(),
        ],
      ),
    );
  }
}
*/

class RegisterFormFields extends StatelessWidget {
  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController passwordController;

  const RegisterFormFields(
      {required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        var cubit = RegisterCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: DropdownButtonFormField(
                items: <DropdownMenuItem<String>>[],
                onChanged: (newValue) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            RegisterFormField(
                controller: nameController,
                validate: (val) {
                  if (val!.isEmpty) {
                    return 'please enter some words';
                  }
                  return null;
                },
                text: 'Full Name',
                keyboardType: TextInputType.name,
                suffixFunction: null),
            RegisterFormField(
                controller: emailController,
                validate: (val) {
                  if (val!.isEmpty) {
                    return 'please enter some words';
                  }
                },
                text: 'Email Address',
                keyboardType: TextInputType.emailAddress),
            RegisterFormField(
                controller: passwordController,
                text: 'Password',
                validate: (val) {
                  if (val!.isEmpty) {
                    return 'please enter some words';
                  }
                },
                suffixIcon: IconButton(
                  onPressed: cubit.changePasswordVisibility,
                  icon: Icon(cubit.suffix),
                ),
                keyboardType: TextInputType.visiblePassword,
                isPassword: cubit.isPassword,
                suffixFunction: () {
                  cubit.changePasswordVisibility();
                }),
          ],
        );
      },
    );
  }
}

class RegisterIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: size.width * 0.65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildLogoIcon(
                imageUrl: 'https://www.nicepng.com/png/full/448-4482584_fb-icon-facebook-icon.png', onTap: () {  },),
            BuildLogoIcon(
                imageUrl: 'https://pics.freeicons.io/uploads/icons/png/357916981530077752-512.png', onTap: () {  },),
            BuildLogoIcon(
                imageUrl: 'https://www.tech-wd.com/wd/wp-content/uploads/2015/11/apple-logo-black-o.jpg', onTap: () {  },),
          ],
        ),
      ),
    );
  }
}

class RegisterButtons extends StatelessWidget {
  final Function() register;

  const RegisterButtons(this.register);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('By registering,you agree to imaginative news'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildCustomTextButton(
                  text: 'Terms of Service',
                  onPressed: () {},
                ),
                Text(' and '),
                BuildCustomTextButton(
                    text: 'privacy policy.', onPressed: () {}),
              ],
            ),
          ],
        ),
        BuildDefaultButton(
            width: size.width * 0.7,
            child: Text(
              'Register Now',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: register),
        Text(
          'Or Continue With',
          style: TextStyle(color: Colors.grey),
        ),
        RegisterIcons(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already,Have an account ?'),
            BuildCustomTextButton(
                text: 'Login',
                onPressed: () {
                  navigateTo(context, LoginScreen());
                }),
          ],
        ),
        Text("Or"),
        BuildDefaultButton(
          width: size.width * 0.7,
          child: Text(
            'Discover App',
          ),
          onPressed: () {
            showDialog(
                context: context, builder: (_) => myAlertDialog(context));
          },
        ),
      ],
    );
  }

  AlertDialog myAlertDialog(BuildContext context) {
    return AlertDialog(
      content: Text('Please sign up to use the app'),
      backgroundColor: Colors.grey[400],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      actions: [
        Center(
          child: BuildCustomTextButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.of(context).pop();
              }),
        )
      ],
    );
  }
}

class RegisterBody extends StatelessWidget {
  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController passwordController;

  final Function() register;

  const RegisterBody(
      {required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.register});

  @override
  Widget build(BuildContext context) {
    return AuthenticationRadius(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
        child: Column(
          children: [
            RegisterFormFields(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
            ),
            RegisterButtons(register)
          ],
        ),
      ),
    );
  }
}

class AuthenticationRadius extends StatelessWidget {
  final Widget child;

  const AuthenticationRadius({required this.child});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return Container(
      color: primaryColor,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: child,
      ),
    );
  }
}

class BuildLoginButtonWithLogo extends StatelessWidget {
  final String image;
  final String text;
  final Color? color;

  const BuildLoginButtonWithLogo(
      {required this.image, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return BuildDefaultButton(
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildLogoIcon(radius: 17, imageUrl: image, onTap: () {  },),
              SizedBox(
                width: 6,
              ),
              Text(text)
            ],
          ),
        ),
        onPressed: () {});
  }
}

class ContainerWithShadow extends StatelessWidget {
  final Widget child;

  const ContainerWithShadow({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: primaryColor,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]),
        child: child);
  }
}

class ConfirmYourEmailForm extends StatelessWidget {
  final TextEditingController codeController;

  const ConfirmYourEmailForm({required this.codeController});

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10),
          child: LoginTextFormField(
              controller: codeController,
              hint: 'Enter Code',
              isCode: true,
              obscure: true,
              type: TextInputType.number),
        ),
        BuildDefaultButton(
            child: Text('Confirm'),
            onPressed: () {},
            width: size.width,
            radius: 8),
        SizedBox(
          height: 12,
        ),
        BuildCustomTextButton(
            text: 'Send Code Again', onPressed: () {}, color: Colors.black)
      ],
    );
  }
}

class ForgetPasswordBody extends StatelessWidget {
  final TextEditingController emailController ;
  final Function() sendCode ;

   ForgetPasswordBody({required this.sendCode, required this.emailController}) ;

  @override
  Widget build(BuildContext context) {
    return AuthenticationRadius(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Type your Email To Send You the rest password link:',
                    style: dropDownTextFieldStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            ForgetPasswordForm(
              sendCode:sendCode,
              emailController: emailController,
            ),
          ],
        ),
      ),
    );
  }
}

class RestPasswordTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const RestPasswordTextFormField(
      {required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        prefix: Icon(Icons.lock),
        hintText: text,
      ),
    );
  }
}

class ForgetPasswordForm extends StatelessWidget {
  final TextEditingController emailController;
  final Function() sendCode ;

  const ForgetPasswordForm({required this.emailController, required this.sendCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerWithShadow(
          child: LoginTextFormField(
              controller: emailController,
              hint: 'Email Address',
              type: TextInputType.emailAddress),
        ),
        SizedBox(
          height: 30,
        ),
        BuildDefaultButton(child: Text('Send'), onPressed: sendCode),
      ],
    );
  }
}

class LoginTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final bool? isCode;

  final TextInputType type;

  const LoginTextFormField(
      {required this.controller,
      required this.hint,
      required this.type,
      this.isCode,
      this.obscure = false,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Please Enter Your Password';
        } else {
          return null;
        }
      },
      onSaved: (val) {
        controller.text = val!;
      },
      obscureText: obscure,
      textAlign: isCode != null ? TextAlign.center : TextAlign.left,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        hintText: hint,
        border: isCode == null ? InputBorder.none : UnderlineInputBorder(),
      ),
    );
  }
}

class RegisterFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? text;
  final TextInputType? keyboardType;
  final bool isPassword;

  final String? Function(String?) validate;
  final IconButton? suffixIcon;
  final Function? suffixFunction;

  const RegisterFormField({
    required this.controller,
    this.text,
    this.keyboardType,
    required this.validate,
    this.suffixIcon,
    this.suffixFunction,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (text != null)
            Text(
              text!,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            obscureText: isPassword,
            keyboardType: keyboardType,
            validator: validate,
            onSaved: (val) {
              controller.text = val!;
            },
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[200],
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
