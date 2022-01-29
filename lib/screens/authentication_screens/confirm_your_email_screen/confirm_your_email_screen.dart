import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/authentication_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class ConfirmYourEmailScreen extends StatelessWidget {
  final codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Scaffold(
      appBar: BuildAppBarWithCenterTitle(
        title: 'Confirm Your Email',
        action: 'Cancel',
        actionOnTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'A Code has been sent to your email address.Enter that code here.',
                      style: inputTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              ConfirmYourEmailForm(
                codeController: codeController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
