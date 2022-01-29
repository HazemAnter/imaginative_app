import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_cubit.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/product_item.dart';
import 'package:imaginative_news_app/screens/rate-review-screen/rate_review-screen.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class SellerInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8),
          child: Text(
            'Seller Info',
            style: inputTitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.freepik.com/free-photo/senior-thougthful-man-holds-chin-looks-pensively-aside-makes-plannings-wears-spectacles-casual-grey-jumper-isolated-vivid-yellow-wall_273609-44143.jpg'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Youssef Abdelzaher',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              BuildCustomTextButton(text: 'View Profile', onPressed: () {}),
            ],
          ),
        ),
        Center(
          child: BuildDefaultButton(
              child: Text('Message Seller'),
              onPressed: () {},
              width: size.width * 0.7),
        ),
      ],
    );
  }
}

class ProfileButtons extends StatelessWidget {
  final List<Widget> moreDetailsBottomSheetItems = [
    BuildBottomSheetItem('Save', Icons.bookmark_border_sharp, () {}),
    Divider(
      height: 1,
    ),
    BuildBottomSheetItem('Report', Icons.warning, () {}),
  ];

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isMe)
            BuildIconButtonWithCircleAvatar(icon: Icons.update, onTap: () {}),
          if (isMe)
            BuildIconButtonWithCircleAvatar(
                icon: Icons.refresh,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                            title: 'Republish',
                            content:
                                'yor product page still being published in feeds and shown to other users,\n\n3 days must pass from date of last publishing to republish your product page again',
                            actions: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(width: 2),
                                    )),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: BuildCustomTextButton(
                                              text: 'cancel',
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              color: Colors.black,
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(width: 1),
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(width: 1),
                                              )),

                                          child: Center(
                                            child: BuildCustomTextButton(
                                                text: 'Update', onPressed: () {}),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  height: 40,
                                ),
                              ),
                            ],
                          ));
                }),
          if (!isMe)
            Expanded(
              child: BuildFollowButton(
                onPressed: () {},
              ),
            ),
          BuildIconButtonWithCircleAvatar(
            icon: Icons.cloud_upload,
            onTap: () {},
          ),
          BuildIconButtonWithCircleAvatar(
              icon: Icons.link,
              onTap: () {
                Fluttertoast.showToast(
                  msg: "link copied",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[400],
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              }),
          if (!isMe)
            BuildIconButtonWithCircleAvatar(
              icon: Icons.more_vert,
              onTap: () {
                myBottomSheet(context, moreDetailsBottomSheetItems);
              },
              iconColor: Colors.black,
              circleAvatarColor: Colors.grey[300],
            ),
        ],
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const CustomAlertDialog(
      {required this.title, required this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.grey[400],
      content: Row(
        children: [
          Expanded(
              child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w400),
          )),
        ],
      ),
      actions: actions,
    );
  }
}

class DetailsPageView extends StatelessWidget {
  final DetailsScreensCubit cubit;

  const DetailsPageView(this.cubit);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Container(
      height: size.height * 0.35,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
              itemCount: cubit.images.length,
              onPageChanged: (index) {
                cubit.changeIndex(index);
              },
              itemBuilder: (context, index) => Container(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        cubit.images[index],
                      ),
                    ),
                  )),
          Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: cubit.images.length,
              position: cubit.currentIndex.toDouble(),
            ),
          )
        ],
      ),
    );
  }
}

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social Links',
          style: titleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        BuildLogoIcon(
            imageUrl: 'https://www.nicepng.com/png/full/448-4482584_fb-icon-facebook-icon.png',
            radius: 13, onTap: () {  },),
        Divider()
      ],
    );
  }
}

class RateAndReview extends StatelessWidget {
  const RateAndReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              children: [
                BuildCustomTextButton(
                  text: 'Rate & review',
                  onPressed: () {
                    navigateTo(
                      context,
                      RateReviewScreen('mohamed mugs'),
                    );
                  },
                ),
                SizedBox(
                  height: 3,
                ),
                BuildRatingBar(),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class BuildTitleAndSupTitle extends StatelessWidget {
  final String title;
  final String supTitle;
  final bool isLineThrough;
  final bool isBigText;
  final bool seeLess;
  final String? stockAvailability;

  final void Function()? onTab;

  const BuildTitleAndSupTitle(this.title, this.supTitle,
      {this.isLineThrough = false,
      this.isBigText = false,
      this.seeLess = false,
      this.onTab,
      this.stockAvailability});

  @override
  Widget build(BuildContext context) {
    Color stockColor = Colors.red;

    if (stockAvailability == 'in Stock') {
      stockColor = Colors.green;
    } else if (stockAvailability == 'Coming Soon') {
      stockColor = Colors.orange;
    }

    var size = getSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (!isMe && stockAvailability != null)
                    Text('in Stock', style: TextStyle(color: stockColor)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                supTitle,
                maxLines: seeLess ? 3 : 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: isLineThrough ? TextDecoration.lineThrough : null,
                ),
              ),
              if (isBigText)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: InkWell(
                    child: Text(
                      seeLess ? 'see less' : 'see more',
                      style: TextStyle(color: primaryColor),
                    ),
                    onTap: onTab,
                  ),
                ),
              if (title == 'Description')
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: BuildDefaultButton(
                      child: Text('More Info'),
                      onPressed: () {},
                      width: size.width * 0.7,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}

class DetailsRichText extends StatelessWidget {
  const DetailsRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: '1',
            style: TextStyle(color: primaryColor),
          ),
          TextSpan(
            text: ' store is Written to promote this product',
            style: TextStyle(color: Colors.black),
          )
        ])),
        Divider(
          height: 5,
        ),
        if (!isMe)
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: '2',
              style: TextStyle(color: primaryColor),
            ),
            TextSpan(
              text: ' people View this product',
              style: TextStyle(color: Colors.black),
            )
          ])),
        Divider(
          height: 5,
        ),
      ],
    );
  }
}

class StoriesAboutIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Container(
      padding: EdgeInsets.all(8),
      color: primaryColor,
      width: double.infinity,
      child: Text(
        'Stories about it',
        style: inputTitleStyle.copyWith(color: Colors.white),
      ),
    );
  }
}

class ProductBrandName extends StatelessWidget {
  const ProductBrandName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Product brand name',
              style: titleStyle,
            ),
            Spacer(),
            if (!isMe)
              BuildCustomTextButton(
                  text: 'in Stock', onPressed: () {}, color: Colors.green),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Mohamed Mugs',
        ),
      ],
    );
  }
}

class BuildDetailsContainerText extends StatelessWidget {
  final String text;
  final IconData icon;

  const BuildDetailsContainerText({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 15),
      color: Colors.grey[300],
      child: Row(
        children: [
          Icon(
            Icons.warning,
          ),
          SizedBox(
            width: 5,
          ),
          Text('click',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black)),
          SizedBox(
            width: 5,
          ),
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsInformation extends StatelessWidget {
  final DetailsScreensCubit cubit;
  final String type;

  const ProductDetailsInformation(this.cubit, this.type);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildTitleAndSupTitle(
          '$type brand name',
          'El Cheef',
        ),
        BuildTitleAndSupTitle('$type Type Name', 'Gray Mugs'),
        BuildTitleAndSupTitle('$type Price Type', 'Fixed Price'),
        BuildTitleAndSupTitle('$type Price', '100 EGP',
            isLineThrough: type == 'product'),
        BuildTitleAndSupTitle('offer Price', '70 EGP'),
        if (type == 'Skill') BuildTitleAndSupTitle('Hiring', 'part time'),
        if (!isMe) RateAndReview(),
        Text(
          'Reviews',
          style: inputTitleStyle,
        ),
        ReviewItem(),
        Divider(),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: BuildCustomTextButton(text: 'MORE REVIEWS', onPressed: () {}),
        )),
        Divider(),
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
        SizedBox(
          height: 3,
        ),
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
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> reviewsBottomSheetItemsOtherView = [
      BuildBottomSheetItem(
        'Edit review',
        Icons.edit,
        () {},
      ),
      Divider(
        height: 1,
      ),
      BuildBottomSheetItem(
        'Delete review',
        Icons.delete,
        () {},
      ),
    ];
    List<Widget> reviewsBottomSheetItemsMyView = [
      BuildBottomSheetItem(
        'Report review',
        Icons.warning,
        () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: CirclePhotoAndNamed(
                      name: 'Karim Mohamed',
                      image:
                          'https://image.freepik.com/free-photo/senior-thougthful-man-holds-chin-looks-pensively-aside-makes-plannings-wears-spectacles-casual-grey-jumper-isolated-vivid-yellow-wall_273609-44143.jpg',
                    )),
                    BuildCustomIconButton(
                      icon: Icons.more_horiz,
                      color: Colors.black,
                      onTap: () {
                        myBottomSheet(
                            context,
                            isMe
                                ? reviewsBottomSheetItemsMyView
                                : reviewsBottomSheetItemsOtherView);
                      },
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  BuildRatingBar(
                      initialRating: 4.5,
                      itemSize: 12,
                      ignoreGestures: true,
                      itemPadding: 1),
                  SizedBox(
                    width: 5,
                  ),
                  Text('2 days ago'),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Very good mug',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CirclePhotoAndNamed extends StatelessWidget {
  final String image;
  final String name;

  const CirclePhotoAndNamed({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(
          width: 13,
        ),
        Expanded(
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
