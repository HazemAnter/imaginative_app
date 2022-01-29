import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_cubit.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_states.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class CreateSkillTalentScreen extends StatelessWidget {


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

  const CreateSkillTalentScreen(
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
        required this.socialPageLink3Controller, required this.advantagesController, required this.usesController})
  ;
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
                                      'Dear user, As skillTalent presented will be '),
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
                                      ', so we advice you to create page for the best skillTalent you have ')
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

              BuildTextAndRedCircle('skillTalent type'),
              Container(
                height: size.height * 0.05,
                child: BuildDropDownButton(
                  item: cubit.skillTalentTypeItems,
                  onChanged: cubit.changeSkillTalentTypeValue,
                  value: cubit.skillTalentTypeValue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildTextAndRedCircle('skillTalent Type Name'),
              ),
              BuildIconAndHintTextFormField(
                  controller: typeNameController,
                  hint: 'write skillTalent type name',
                  icon: Icons.account_box_rounded,
                  maxLength: 200),
              InformationText(
                  'Football playing, Composing and telling jokes, Costs Killer (ability to reduce Costs wisely to minimum) are examples of Skill/Talent name'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: BuildTextAndRedCircle('Upload Images / Videos'),
              ),
              BuildUploadContainers(cubit: cubit),
              InformationText('High Quality image is highly preferable'),
              InformationText(
                  'Short video to Show your skill is preferable'),
              InformationText(
                  'high quality video/images Showing and describing you skill/Talent will increase your chances of getting hired by employers or getting clients.'),
              SizedBox(
                height: 10,
              ),
              Text(
                'skillTalent Brand Type',
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
              BuildTextAndRedCircle('skillTalent Brand Name'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                    controller: brandNameController,
                    hint: 'Type skillTalent Brand Name',
                    icon: Icons.wifi_calling_outlined,
                    maxLength: 200),
              ),
              BuildTextAndRedCircle('Description'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                    controller: descriptionController,
                    hint:
                        'Describe your skill in points : \n\nExample Playing football as Striker\n\ni am skilled at Scoring goal by head or leg ',
                    icon: Icons.wifi_calling_outlined,
                    maxLength: 3000),
              ),
              BuildTextAndRedCircle('Credentials'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                    controller: credentialsController,
                    hint:
                        'List your skill related Credentials like: \n\n1.Any practical Activities you engaged in that sharpen your skill\n\n2.Any courses taken to Support your skill\n\nAny School/University Projects you engaged Sypport this skill\n\n4.Any other Activities/doings that sharpen and support your Skill/Talent',
                    icon: Icons.wifi_calling_outlined,
                    maxLength: 3000),
              ),
              BuildTextAndRedCircle('Stock Availability'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildWidgetAndDropFormFields(
                  leading: Icon(Icons.donut_large_outlined),
                  item: cubit.stockAvailabilityItems,
                  value: cubit.stockAvailabilityValue,
                  onChanged: cubit.changeStockAvailabilityValue,
                ),
              ),
              BuildTextAndRedCircle('Advantages'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                  controller: advantagesController,
                  hint:
                      'Describe what advantages Clients wil get when hiring you to benefit from your skill\n\nExample: Costs killer skill\n\n1.Decreasing Costs and increasing Company/Project profits\n\nPricing products/services Competitively as a result of decreasing Cost to minimum ',
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
                      'Describe in what areas your skill will be used \n\nExample:Composing/telling jokes\n\n1.Be hired as a Comedian Actor in a film.\n\n2.Creating and writing Jokes related Content at websites/mobile apps/magazines \n\nBe hired as A Scriptwriter for a Comedian Sitecom/Film\n\n4.Be hired as Standup Comedian in Cafes/Restaurants to entertain people ',
                  icon: Icons.link,
                  maxLength: 1500,
                ),
              ),
              Text(
                'skillTalent URL',
                style: inputTitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildIconAndHintTextFormField(
                  controller:urlController,
                  hint: 'paste your website or web page link',
                  icon: Icons.link,
                ),
              ),
              Text(
                'Hiring',
                style: inputTitleStyle,
              ),
              BuildWidgetAndDropFormFields(
                leading: Text(
                  'Hire me as ',
                  style: dropDownTextFieldStyle,
                ),
                value: cubit.hiringValue,
                item: cubit.hiringItems,
                onChanged: cubit.changeHiringValue,
              ),
              SizedBox(
                height: 8,
              ),
              BuildTextAndRedCircle('Price'),
              BuildWidgetAndDropFormFields(
                leading: Text(
                  'Price Type',
                  style: dropDownTextFieldStyle,
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
                  'Although it is optional field but presenting offers increase your chances of getting Hires/getting Clients'),
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
