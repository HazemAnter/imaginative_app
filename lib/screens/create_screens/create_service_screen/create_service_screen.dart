import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_cubit.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_states.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class CreateServiceScreen extends StatelessWidget {
  final TextEditingController typeNameController;

  final TextEditingController brandNameController;

  final TextEditingController descriptionController;

  final TextEditingController credentialsController;

  final TextEditingController advantagesController;
  final TextEditingController usesController;

  final TextEditingController urlController;

  final TextEditingController determinePriceController;

  final TextEditingController offerPriceController;

  final TextEditingController describeOfferController;

  final TextEditingController socialPageLink1Controller;

  final TextEditingController socialPageLink2Controller;

  final TextEditingController socialPageLink3Controller;

  const CreateServiceScreen(
      {required this.typeNameController,
      required this.brandNameController,
      required this.descriptionController,
      required this.credentialsController,
      required this.urlController,
      required this.determinePriceController,
      required this.offerPriceController,
      required this.describeOfferController,
      required this.socialPageLink1Controller,
      required this.socialPageLink2Controller,
      required this.socialPageLink3Controller,
      required this.advantagesController,
      required this.usesController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePageScreenCubit, CreatePageScreenState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = CreatePageScreenCubit.get(context);
          var size = MediaQuery.of(context).size;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Icon(Icons.warning),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text:
                                      'Dear user, As service presented will be '),
                              TextSpan(
                                text: 'rated/reviewed',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              TextSpan(
                                  text:
                                      ', so we advice you to create page for the best service you have ')
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ImageAndNameAndDropDownButton(
                cubit: cubit,
                name: 'Karima Mohamed',
                image:
                'https://image.freepik.com/free-photo/senior-thougthful-man-holds-chin-looks-pensively-aside-makes-plannings-wears-spectacles-casual-grey-jumper-isolated-vivid-yellow-wall_273609-44143.jpg',
              ),

              BuildTextAndRedCircle('service type'),
              Container(
                height: size.height * 0.05,
                child: BuildDropDownButton(
                  item: cubit.serviceTypeItems,
                  onChanged: cubit.changeServiceTypeValue,
                  value: cubit.serviceTypeValue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildTextAndRedCircle('service Type Name'),
              ),
              BuildIconAndHintTextFormField(
                  controller: typeNameController,
                  hint: 'write service type name',
                  icon: Icons.account_box_rounded,
                  maxLength: 200),
              InformationText('For Example Graphic design'),
              SizedBox(
                height: 8,
              ),
              BuildTextAndRedCircle('Upload Images'),
              SizedBox(
                height: 8,
              ),
              BuildUploadContainers(cubit: cubit),
              InformationText('High Quality image is highly preferable'),
              InformationText(
                  'Image rendered on white background is preferable (physical services only)'),
              InformationText(
                  'high quality images Showing and describing you service and offers presented increase your chances of selling it.'),
              SizedBox(
                height: 10,
              ),
              Text(
                'service Brand Type',
                style: inputTitleStyle,
              ),
              Container(
                height: size.height * 0.05,
                child: BuildDropDownButton(
                  item: cubit.brandItems,
                  onChanged: cubit.changeBrandTypeValue,
                  value: cubit.brandTypeValue,
                ),
              ),
              BuildTextAndRedCircle('service Brand Name'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                    controller: brandNameController,
                    hint: 'Type service Brand Name',
                    icon: Icons.wifi_calling_outlined,
                    maxLength: 200),
              ),
              BuildTextAndRedCircle('Description'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                    controller: descriptionController,
                    hint:
                        'Describe your service Features in points like: \n\n1.service brief \n\n2.Types or subtypes of Services presented \n\n3.Available Service subscription packages \n\n4.Available Warranty (if any) \n\n5. Warranty \n\n6. Payment method \n\n7.installment option \n\n8.delivery method',
                    icon: Icons.wifi_calling_outlined,
                    maxLength: 3000),
              ),
              BuildTextAndRedCircle('Credentials'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                    controller: credentialsController,
                    hint:
                        'Describe your service related Credentials like: \n\n1.project portfolio \n\n2.No.of experience years presenting this Service\n\n3.Professional certificates\n\n4.Academic studies\n\nEducation Couurses\n\n6.ISO certificates',
                    icon: Icons.wifi_calling_outlined,
                    maxLength: 3000),
              ),
              InformationText(
                  'Mentioning Credentials increase your chances of getting clients'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildTextAndRedCircle('Stock Availability'),
              ),
              BuildWidgetAndDropFormFields(
                leading: Icon(Icons.donut_large_outlined),
                item: cubit.stockAvailabilityItems,
                value: cubit.stockAvailabilityValue,
                onChanged: cubit.changeStockAvailabilityValue,
              ),
              SizedBox(
                height: 16,
              ),
              BuildTextAndRedCircle('Advantages'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                  controller: advantagesController,
                  hint:
                      'Describe your service Advantages in points like: \n\n1Example: Graphic designing Service \n\n1.presenting Creative designs catered to Client needs\n\nOn time project delivery',
                  icon: Icons.apps,
                  maxLength: 1500,
                ),
              ),
              Text(
                'Uses Type',
                style: inputTitleStyle,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: size.height * 0.05,
                width: size.width * 0.4,
                child: BuildDropDownButton(
                  item: cubit.usesTypeItems,
                  onChanged: cubit.changeUsesTypeValue,
                  value: cubit.usesTypeValue,
                  isExpanded: true,
                ),
              ),
              BuildTextAndRedCircle('Uses'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                  controller: usesController,
                  hint:
                      'Describe your service different uses in points like: \n\nExample Graphic designing \n\n1.Designing Company/service brand logos\n\n2.Making designs for Social media posts',
                  icon: Icons.link,
                  maxLength: 1500,
                ),
              ),
              Text(
                'service URL',
                style: inputTitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                  controller: urlController,
                  hint: 'paste your website or web page link',
                  icon: Icons.link,
                ),
              ),
              InformationText(
                  'Your Behance, Toptal, UpWork,Fiver profile are examples of webpage links.'),
              InformationText(
                  'Although his fields is optional but attaching your service website or webpage will gives more credibility to your service and increase your changes of selling it'),
              SizedBox(
                height: 8,
              ),
              BuildTextAndRedCircle('Price'),
              BuildWidgetAndDropFormFields(
                leading: Text(
                  'Price Type',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                value: cubit.priceTypeValue,
                item: cubit.priceTypeItems,
                onChanged: cubit.changePriceTypeValue,
              ),
              SizedBox(
                height: 16,
              ),
              BuildIconAndHintTextFormField(
                controller: determinePriceController,
                icon: Icons.wysiwyg,
                hint: 'Determine price',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildWidgetAndDropFormFields(
                  leading: Icon(Icons.source),
                  item: cubit.afghanItems,
                  value: cubit.afghanValue,
                  onChanged: cubit.changeAfghanValue,
                  prefix: Text('Afghan afghani'),
                ),
              ),
              Text(
                'Offer',
                style: inputTitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                    hint: 'Determine offer price ',
                    icon: Icons.pan_tool_rounded,
                    controller: offerPriceController),
              ),
              BuildIconAndHintTextFormField(
                hint: 'Describe your offer ',
                icon: Icons.pages_outlined,
                controller: describeOfferController,
                maxLength: 3000,
              ),
              InformationText(
                  'Although it is optional field but presenting offers increase your chances of selling your service and getting clients'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Social Links',
                  style: inputTitleStyle,
                ),
              ),
              BuildIconAndHintTextFormField(
                icon: Icons.link,
                hint: 'paste your social page link',
                controller: socialPageLink1Controller,
              ),
              SizedBox(
                height: 8,
              ),
              BuildIconAndHintTextFormField(
                icon: Icons.link,
                hint: 'paste your social page link',
                controller: socialPageLink2Controller,
              ),
              SizedBox(
                height: 8,
              ),
              BuildIconAndHintTextFormField(
                icon: Icons.link,
                hint: 'paste your social page link',
                controller: socialPageLink3Controller,
              ),
            ],
          );
        });
  }
}
