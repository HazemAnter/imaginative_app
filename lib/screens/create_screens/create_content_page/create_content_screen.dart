import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_cubit.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_states.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
class CreateContentScreen extends StatelessWidget {
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

  const CreateContentScreen(
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
                                'Dear user, As content presented will be '),
                            TextSpan(
                              text: 'rated/reviewed',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                                text:
                                ', so we advice you to create page for the best content you have ')
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
            BuildTextAndRedCircle('content type'),
            Container(
              height: size.height * 0.05,
              child: BuildDropDownButton(
                item: cubit.contentTypeItems,
                onChanged: cubit.changeContentTypeValue,
                value: cubit.contentTypeValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: BuildTextAndRedCircle('content Type Name'),
            ),
            BuildIconAndHintTextFormField(
                controller: typeNameController,
                hint: 'write content type name',
                icon: Icons.account_box_rounded,
                maxLength: 200),
            BuildTextAndRedCircle('Upload Images / Videos'),
            SizedBox(
              height: 8,
            ),
            BuildUploadContainers(
              cubit: cubit,
            ),
            InformationText('High Quality image is highly preferable'),
            InformationText(
                'Short video to Show your Content is preferable'),
            InformationText(
                'high quality video/images Showing and describing you content,promos and offers presented increase your chances of getting Subscribers/Followers.'),
            SizedBox(
              height: 10,
            ),
            Text(
              'content Brand Type',
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
            BuildTextAndRedCircle('content Brand Name'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: BuildIconAndHintTextFormField(
                  controller: brandNameController,
                  hint: 'Type content Brand Name',
                  icon: Icons.wifi_calling_outlined,
                  maxLength: 200),
            ),
            InformationText(
                'YouTuber Channel name,Food/Travel instagram blogger page name are examples of Content brand name'),
            SizedBox(
              height: 8,
            ),
            BuildTextAndRedCircle('Description'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: BuildIconAndHintTextFormField(
                  controller: descriptionController,
                  hint:
                  'Describe your content  in points like: \n\n1.About channel/page brief \n\n2.About Content presenter brief \n\n3.Goal of the channel/page Content',
                  icon: Icons.wifi_calling_outlined,
                  maxLength: 3000),
            ),
            InformationText(
                'Clear description of content help people decide either to Subscribe to/Follow your content or not'),
            SizedBox(
              height: 8,
            ),
            BuildTextAndRedCircle('Credentials'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: BuildIconAndHintTextFormField(
                  controller: credentialsController,
                  hint:
                  'List your content related Credentials like: \n\n1.Experience/Education background supporting you in presenting the content \n\n2.Any awards you won related to the Content you present',
                  icon: Icons.wifi_calling_outlined,
                  maxLength: 3000),
            ),
            InformationText(
                'Althought this fields is optional but mentioning your Credentials adds more credibility to you and thus make more people decide to Subscribe to/Follow your content'),
            SizedBox(
              height: 8,
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
                'inform audience about what Advantages they will get when Subscribing to/Following your Content',
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
                'Describe different uses of content: \n\nFor Example \n\nyou can use Purchased Education videos at your Education-related blog or website',
                icon: Icons.link,
                maxLength: 1500,
              ),
            ),
            Text(
              'content URL',
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
                'Your Youtube channel link,foods/Travel instagram blog page link are examples of webpage link'),
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
                'Although it is optional field but presenting offers increasing  chances of getting Subscribers to your paid Content packages'),
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
      },
    );
  }
}

