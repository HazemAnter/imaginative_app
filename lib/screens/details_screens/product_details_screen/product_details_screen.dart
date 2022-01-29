import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_cubit.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_states.dart';
import 'package:imaginative_news_app/screens/details_screens/widget/widget.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/story_item.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  final storyController = TextEditingController();
  final String type;

   ProductDetailsScreen({ required this.type}) ;

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);

    return BlocConsumer<DetailsScreensCubit, DetailsScreensState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = DetailsScreensCubit.get(context);
        return Scaffold(
          appBar: BuildAppBarWithCenterTitle(title: 'mohamed Mugs', ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsPageView(cubit),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(isMe && type=='Product')
                        TextField(
                          controller: storyController,

                          decoration: InputDecoration(
                          filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primaryColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: primaryColor)),
                            hintText: 'Write a Story about product',
                          ),
                        ),
                      if (isMe)
                        InformationText(
                            'More Stories Means More Advertising for this Product',),
                      ProfileButtons(),
                      if (isMe&&type=='Product')
                        BuildDetailsContainerText(
                          text:
                              'to update product page info like price and other info & republish it again.',
                          icon: Icons.update,
                        ),
                      if (isMe&&type=='Product')
                        BuildDetailsContainerText(
                          text: 'to update product page without editing.',
                          icon: Icons.refresh,
                        ),
                      if (!isMe)
                        InformationText(
                            'Following this product will enable you to receive update stories feeds about it'),
                      SizedBox(height: 5,),

                      if(!isMe&&type=='Product')DetailsRichText(),
                      if (!isMe) SellerInfoWidget(),
                      Divider(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ProductDetailsInformation(cubit,type),
                          StoriesAboutIt(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('No Stories found for this Product'),
                          ),
                          StoryItem(),
                        ],
                      )
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
