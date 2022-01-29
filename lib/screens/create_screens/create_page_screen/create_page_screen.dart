import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/layout/layout.dart';
import 'package:imaginative_news_app/screens/create_screens/create_content_page/create_content_screen.dart';
import 'package:imaginative_news_app/screens/create_screens/create_product_screen/create_product_screen.dart';
import 'package:imaginative_news_app/screens/create_screens/create_service_screen/create_service_screen.dart';
import 'package:imaginative_news_app/screens/create_screens/create_skill-talent_screen/create_skill-talentt_screen.dart';
import 'package:imaginative_news_app/screens/details_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

import 'create_page_screen_cubit/create_page_screen_cubit.dart';
import 'create_page_screen_cubit/create_page_screen_states.dart';

class CreatePageScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController typeNameController = TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController credentialsController = TextEditingController();
  final TextEditingController advantagesController = TextEditingController();
  final TextEditingController usesController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController determinePriceController =
      TextEditingController();
  final TextEditingController offerPriceController = TextEditingController();
  final TextEditingController describeOfferController = TextEditingController();
  final TextEditingController socialPageLink1Controller =
      TextEditingController();
  final TextEditingController socialPageLink3Controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePageScreenCubit, CreatePageScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          var size = MediaQuery.of(context).size;
          var cubit = CreatePageScreenCubit.get(context);
          String pageTypeValue = cubit.pageTypeValue;
          var body;
          if (cubit.pageTypeValue == 'Product') {
            body = CreateProductScreen(
              typeNameController: typeNameController,
              brandNameController: brandNameController,
              descriptionController: descriptionController,
              credentialsController: credentialsController,
              advantagesController: advantagesController,
              usesController: usesController,
              urlController: urlController,
              determinePriceController: determinePriceController,
              offerPriceController: offerPriceController,
              describeOfferController: describeOfferController,
              socialPageLink1Controller: socialPageLink1Controller,
              socialPageLink2Controller: socialPageLink3Controller,
              socialPageLink3Controller: socialPageLink3Controller,
            );
          }
          if (cubit.pageTypeValue == 'Service') {
            body = CreateServiceScreen(
              typeNameController: typeNameController,
              brandNameController: brandNameController,
              descriptionController: descriptionController,
              credentialsController: credentialsController,
              advantagesController: advantagesController,
              usesController: usesController,
              urlController: urlController,
              determinePriceController: determinePriceController,
              offerPriceController: offerPriceController,
              describeOfferController: describeOfferController,
              socialPageLink1Controller: socialPageLink1Controller,
              socialPageLink3Controller: socialPageLink3Controller,
              socialPageLink2Controller: socialPageLink3Controller,
            );
          }
          if (cubit.pageTypeValue == 'Content') {
            body = CreateContentScreen(
              typeNameController: typeNameController,
              brandNameController: brandNameController,
              descriptionController: descriptionController,
              credentialsController: credentialsController,
              advantagesController: advantagesController,
              usesController: usesController,
              urlController: urlController,
              determinePriceController: determinePriceController,
              offerPriceController: offerPriceController,
              describeOfferController: describeOfferController,
              socialPageLink1Controller: socialPageLink1Controller,
              socialPageLink2Controller: socialPageLink3Controller,
              socialPageLink3Controller: socialPageLink3Controller,
            );
          }
          if (cubit.pageTypeValue == 'Skill/Talent') {
            body = CreateSkillTalentScreen(
              typeNameController: typeNameController,
              brandNameController: brandNameController,
              descriptionController: descriptionController,
              credentialsController: credentialsController,
              advantagesController: advantagesController,
              usesController: usesController,
              urlController: urlController,
              determinePriceController: determinePriceController,
              offerPriceController: offerPriceController,
              describeOfferController: describeOfferController,
              socialPageLink1Controller: socialPageLink1Controller,
              socialPageLink3Controller: socialPageLink3Controller,
              socialPageLink2Controller: socialPageLink3Controller,
            );
          }
          return Scaffold(
            appBar: BuildAppBarWithCenterTitle(
              title: 'create $pageTypeValue page',
              action: 'Next',
              leadingOnTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) => BackAlertDialog());
              },
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey[200],
                      padding: EdgeInsets.only(
                        top: 16,
                        right: 16,
                        left: 16,
                        bottom: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildTextAndRedCircle('Choose Page Type to Create'),
                          Container(
                            height: size.height * 0.05,
                            child: BuildDropDownButton(
                              item: cubit.pageTypeItems,
                              onChanged: cubit.changeCreatePageTypeValue,
                              value: cubit.pageTypeValue,
                              isExpanded: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: body,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}
class BackAlertDialog extends StatelessWidget {
  const BackAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Save This Story as a draft ?',
      content:
      'if ypu discard now,you \'ll lose this story',
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BuildCustomTextButton(
                text: 'Save as a draft ', onPressed: () {}),
            Divider(),
            BuildCustomTextButton(
              text: 'Discard Story',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            LayoutScreen()));
              },
              color: Colors.red,
            ),
            Divider(),
            BuildCustomTextButton(
                text: 'Save as a draft ', onPressed: () {}),
            Divider(),
          ],
        )
      ],
    );
  }
}

