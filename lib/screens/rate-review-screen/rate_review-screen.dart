import 'package:flutter/material.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/product_item.dart';
import 'package:imaginative_news_app/shared/components/components.dart';

class RateReviewScreen extends StatelessWidget {
  final reviewController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String name;

  RateReviewScreen(this.name);



  @override
  Widget build(BuildContext context) {
    final List<Widget> rateReviewBottomSheetItems = [
    BuildBottomSheetItem(
      'Discard Change',
      Icons.delete,
          () {
        Navigator.of(context).pop();
      },
    ),
  ];
    var size = getSize(context);
    return Scaffold(
      appBar: BuildAppBarWithCenterTitle(
        title: name,
        leadingOnTap: () {
          myBottomSheet(context, rateReviewBottomSheetItems);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 25, right: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://image.freepik.com/free-photo/senior-thougthful-man-holds-chin-looks-pensively-aside-makes-plannings-wears-spectacles-casual-grey-jumper-isolated-vivid-yellow-wall_273609-44143.jpg'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Youssef Abdelzaher',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Sharing publicly',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: BuildRatingBar(),
                ),
                BuildIconAndHintTextFormField(
                    hint: ' Write a review',
                    isBorder: false,
                    controller: reviewController),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: BuildDefaultButton(
                      child: Text('Submit'),
                      onPressed: () {},
                      width: size.width),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
