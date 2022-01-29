import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/authentication_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class RestPasswordScreen extends StatelessWidget {
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Scaffold(
      appBar: BuildAppBarWithCenterTitle(
        title: 'Rest Password',
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              children: [
                RestPasswordTextFormField(
                    controller: newPasswordController, text: 'New Password'),
                SizedBox(
                  height: 10,
                ),
                RestPasswordTextFormField(
                    controller: confirmNewPasswordController,
                    text: 'Confirm New Password'),
                SizedBox(
                  height: 18,
                ),
                BuildDefaultButton(
                    child: Text('Send'),
                    onPressed: () {},
                    width: size.width * 0.7)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
