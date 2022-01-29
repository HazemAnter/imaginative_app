import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_cubit.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_states.dart';
import 'package:imaginative_news_app/screens/details_screens/widget/widget.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class SkillDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return BlocConsumer<DetailsScreensCubit, DetailsScreensState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = DetailsScreensCubit.get(context);
        return Scaffold(
          appBar: BuildAppBarWithCenterTitle(
            title: 'El Cheef',
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsPageView(cubit),
                ProfileButtons(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InformationText(
                          'Following this Skill will enable you to receive update stories feeds about it'),
                     /* RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: '1',
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(
                          text: ' store is Written to promote this Skill',
                          style: TextStyle(color: Colors.black),
                        )
                      ])),*/
                      Divider(
                        height: 5,
                      ),
                      /*RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: '2',
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(
                          text: ' people View this Skill',
                          style: TextStyle(color: Colors.black),
                        )
                      ])),*/
                      SellerInfoWidget(),
                      Divider(
                        height: 16,
                      ),
                      SkillDetailsInformation(cubit)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}

class SkillDetailsInformation extends StatelessWidget {
  final DetailsScreensCubit cubit;

  const SkillDetailsInformation(this.cubit);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildTitleAndSupTitle('Skill brand name', 'El Cheef'),
        BuildTitleAndSupTitle('Skill Type Name', 'Cooking'),
        BuildTitleAndSupTitle(
            'Skill Price Type', 'Fixed Price'),
        BuildTitleAndSupTitle('Skill Price', '100 EGP',),
        BuildTitleAndSupTitle('Other Price', '......'),
        BuildTitleAndSupTitle('Hiring', 'part time'),
        RateAndReview(),
        BuildTitleAndSupTitle('Description',
            'descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
            isBigText: true,
            seeLess: cubit.descriptionSeeLess,
            onTab: cubit.changeDescriptionSeeLess),
        BuildTitleAndSupTitle('Credentials',
            'descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
            isBigText: true,
            seeLess: cubit.credentialsSeeLess,
            onTab: cubit.changeCredentialsSeeLess),
        SocialLinks(),
        BuildTitleAndSupTitle('Advantages',
            'descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
            isBigText: true,
            seeLess: cubit.advantagesSeeLess,
            onTab: cubit.changeAdvantagesSeeLess),
        BuildTitleAndSupTitle('Uses',
            'descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
            isBigText: true,
            seeLess: cubit.usesSeeLess,
            onTab: cubit.changeUsesSeeLess),
        BuildTitleAndSupTitle('Offer Details',
            'descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription',
            isBigText: true,
            seeLess: cubit.offerDetailsSeeLess,
            onTab: cubit.changeOfferDetailsSeeLess),
        StoriesAboutIt(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('No Stories found for this Skill'),
        ),
      ],
    );

  }
}
