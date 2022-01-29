
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_cubit.dart';
import 'package:imaginative_news_app/screens/create_screens/create_page_screen/create_page_screen_cubit/create_page_screen_states.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class CreateStoryScreen extends StatelessWidget {
  final storyHeaderLineController = TextEditingController();
  final storyIntroController = TextEditingController();
  final storyBodyController = TextEditingController();
  final storyConclusionController = TextEditingController();
  final productStoryTaglineController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePageScreenCubit, CreatePageScreenState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var size = MediaQuery.of(context).size;
        var cubit = CreatePageScreenCubit.get(context);

        return Scaffold(
          appBar: BuildAppBarWithCenterTitle(
            title: 'create Story page',
            action: 'Next',
            leadingOnTap: () {
              showDialog(
                  context: context, builder: (context) => BackAlertDialog());
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Form(
                key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    ImageAndNameAndDropDownButton(
                      cubit: cubit,
                      name: 'Karima Mohamed',
                      image:
                          'https://image.freepik.com/free-photo/senior-thougthful-man-holds-chin-looks-pensively-aside-makes-plannings-wears-spectacles-casual-grey-jumper-isolated-vivid-yellow-wall_273609-44143.jpg',
                    ),
                    BuildTextAndRedCircle('Upload header Image'),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                      child: Row(
                        children: [
                          BuildUploadImageContainerItem(
                            cubit: cubit,
                            index: 0,
                          ),
                        ],
                      ),
                    ),
                    InformationText(
                        'Using Catchy,High quality product reated header image will attract users attention and encourage them to read your story about your product.'),
                    SizedBox(
                      height: 14,
                    ),
                    BuildTextAndRedCircle('Story HeaderLine'),
                    BuildDropDownButton(
                        item: cubit.storyHeaderLineItems,
                        isExpanded: true,
                        value: cubit.storyHeaderLineValue == ''
                            ? null
                            : cubit.storyHeaderLineValue,
                        hint: 'Enter Story HeaderLine',
                        onChanged: cubit.changeStoryHeaderLineValue),
                    InformationText(
                        'Choose Story headline Sentence that raises Curiosity to Users,So they will be encouraged to read your Story about your product'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: BuildTextAndRedCircle('Disclaimer'),
                    ),
                    Container(
                        color: Colors.grey[300],
                        child: BuildDropDownButton(
                            item: cubit.disclaimerItems,
                            value: cubit.disclaimerValue,
                            onChanged: cubit.changeDisclaimerValue,
                            isExpanded: true)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child:
                          BuildTextAndRedCircle('Choose imaginative Year Iy'),
                    ),
                    BuildDropDownButton(
                        item: cubit.imaginativeYearItems,
                        value: cubit.imaginativeYearValue,
                        onChanged: cubit.changeImaginativeYearValue,
                        isExpanded: true),
                    BuildTextAndRedCircle('Product Story Tagline'),
                    BuildIconAndHintTextFormField(
                      controller: productStoryTaglineController,
                      maxLength: 200,
                      isBorder: false,
                      hint: 'For example Have a break, have a Kit Kat.',
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    InformationText(
                      'it is like the TV ad tagline, for example Have a break, have a Kit Kat.',
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Story Featured Product',
                      style: inputTitleStyle,
                    ),
                    BuildDropDownButton(
                        item: cubit.storyFeaturedProductItems,
                        value: cubit.storyFeaturedProductValue,
                        onChanged: cubit.changeStoryFeaturedProductValue),
                    InformationText(
                        'Beware of not coping ideass from others as this may subject ypu to copyright legal consequences. ',
                        iconColor: Colors.red),
                    SizedBox(
                      height: 14,
                    ),
                    BuildTextAndRedCircle('Story intro'),
                    BuildIconAndHintTextFormField(
                        hint:
                            'Write opening sentence for story or story main idea \n\n\ninsert pictures anywhere here by clicking photos.',
                        isBorder: false,
                        controller: storyIntroController),
                    SizedBox(
                      height: 14,
                    ),
                    BuildTextAndRedCircle('Story Body'),
                    BuildIconAndHintTextFormField(
                        hint:
                            'Write story details ,\n\n\nInsert pictures anywhere here by clicking photos.',
                        isBorder: false,
                        controller: storyBodyController),
                    SizedBox(
                      height: 14,
                    ),
                    BuildTextAndRedCircle('Story Conclusion'),
                    BuildIconAndHintTextFormField(
                        hint:
                            'Write story conclusion or closing sentence for the story \n\n\ninsert pictures anywhere here by clicking photos',
                        isBorder: false,
                        maxLength: 3000,
                        controller: storyConclusionController),
                    InformationText(
                      'your story will be like a Tv ad about your product,\n\nit will be about imaginative situation which you send marketing message to Targed Audience showing them your product unique features, advantages and uses.',
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      height: size.height * 0.07,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: HorizontalIconAndLabel(
                              icon: Icons.photo,
                              iconColor: Colors.green,
                              label: 'Photos',
                              onTap: (){},

                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                              child: HorizontalIconAndLabel(
                                icon: Icons.book,
                                iconColor: primaryColor,
                                label: 'Templates',
                                onTap: (){},
                              )),
                        ],
                      ),
                    )
                  ])),
            ),
          ),
        );
      },
    );
  }
}

class HorizontalIconAndLabel extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Function()? onTap;

  const HorizontalIconAndLabel(
      {required this.label, required this.icon, required this.iconColor,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 25,
          ),
          SizedBox(
            width: 8,
          ),
          Text(label)
        ],
      ),
    );
  }
}
