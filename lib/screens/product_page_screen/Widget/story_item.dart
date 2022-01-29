import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_cubit.dart';
import 'package:imaginative_news_app/screens/details_screens/details_Screens_cubit/details_Screens_states.dart';
import 'package:imaginative_news_app/screens/product_page_screen/Widget/product_item.dart';
import 'package:imaginative_news_app/shared/components/components.dart';
import 'package:imaginative_news_app/shared/style/colors/colors.dart';

class StoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return BlocConsumer<DetailsScreensCubit, DetailsScreensState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = DetailsScreensCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StoryItemHeader(
                        cubit: cubit,
                      ),
                      StoryItemImage(),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'A Story of Mohamed mugs',
                        style: inputTitleStyle,
                      ),
                      ContainerTextInStoryItem(),
                      Container(
                        color: primaryColor,
                        child: Column(
                          children: [
                            RowOfIconAndText(Icons.volume_up_outlined,
                                'your breakfast lovely mug'),
                            RowOfIconAndText(
                                Icons.arrow_downward_rounded, 'Purchase Now'),
                          ],
                        ),
                      ),
                      SeeMoreAndSeeLeesButton(
                          cubit.storySeeLess, cubit.changeStorySeeLess),
                      if (cubit.storySeeLess) SmallProductItemInStoreItem(),
                      LikeCommentShareButtons(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class BuildStoryItemIconAndLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const BuildStoryItemIconAndLabel(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 13,
              color: Colors.black,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class SeeMoreAndSeeLeesButton extends StatelessWidget {
  final bool isSeeLess;
  final Function() onPressed;

  const SeeMoreAndSeeLeesButton(
    this.isSeeLess,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BuildCustomTextButton(
          text: isSeeLess ? 'see less....' : 'see more....',
          onPressed: onPressed,
          color: Colors.black),
    );
  }
}

class ContainerTextInStoryItem extends StatelessWidget {
  const ContainerTextInStoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 8),
        color: Colors.grey[300],
        child: Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.post_add,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('IY 2022'),
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                'This Story is imaginative and used to promote Product/Service/Skill/Content ',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallProductItemInStoreItem extends StatelessWidget {
  const SmallProductItemInStoreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: size.width * 0.4,
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  'https://image.freepik.com/free-psd/disposable-plastic-coffee-cup-packaging-package-branding-identity-ready-your-design_1150-37040.jpg'),
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 5,
            ),
            ProductInformation(),
            BuildDefaultButton(
                child: Text('more Details'),
                onPressed: () {},
                radius: 0,
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}

class LikeCommentShareButtons extends StatelessWidget {
  const LikeCommentShareButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BuildStoryItemIconAndLabel(Icons.favorite_border, 'like'),
          BuildStoryItemIconAndLabel(Icons.mode_comment_outlined, 'comment'),
          BuildStoryItemIconAndLabel(Icons.ios_share, 'share'),
        ],
      ),
    );
  }
}

class RowOfIconAndText extends StatelessWidget {
  final IconData icon;
  final String text;

  const RowOfIconAndText(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductPostBottom extends StatelessWidget {
  const ProductPostBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: '1',
              style: TextStyle(color: primaryColor),
            ),
            TextSpan(
              text: ' store',
              style: TextStyle(color: Colors.black),
            )
          ])),
          Row(
            children: [
              Text('2'),
              Container(
                  height: 20,
                  child: BuildIconButtonWithCircleAvatar(
                      icon: Icons.remove_red_eye_outlined, onTap: () {}))
            ],
          ),
        ],
      ),
    );
  }
}

class StoryItemImage extends StatelessWidget {
  const StoryItemImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = getSize(context);
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://image.freepik.com/free-psd/arrangement-minimal-coffee-mugs_23-2149027126.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class StoryItemHeader extends StatefulWidget {
  final DetailsScreensCubit cubit;

  StoryItemHeader({required this.cubit});

  @override
  _StoryItemHeaderState createState() => _StoryItemHeaderState();
}

class _StoryItemHeaderState extends State<StoryItemHeader> {
   bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> storyBottomSheetItemsOtherView = [
      BuildBottomSheetItem('Save', Icons.bookmark_border_sharp, () {}),
      Divider(
        height: 1,
      ),
      BuildBottomSheetItem('Report', Icons.warning, () {}),
      Divider(
        height: 1,
      ),
      BuildBottomSheetItem(
          widget.cubit.isMute
              ? 'Turn on notification'
              : 'Mute notification on this product',
          Icons.warning, () {
        widget.cubit.changeMuteValue();
        Navigator.of(context).pop();
      }),
    ];
    final List<Widget> storyBottomSheetItemsMyView = [
      BuildBottomSheetItem('edit', Icons.edit, () {}),
      Divider(
        height: 1,
      ),
      BuildBottomSheetItem('Delete', Icons.delete, () {}),
      Divider(
        height: 1,
      ),
      BuildBottomSheetItem('Save to my templates', Icons.note_add, () {}),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: ImagePhotoAndNameAndDate(
            image:
                'https://image.freepik.com/free-photo/senior-thougthful-man-holds-chin-looks-pensively-aside-makes-plannings-wears-spectacles-casual-grey-jumper-isolated-vivid-yellow-wall_273609-44143.jpg',
            name: 'Ali Mohsen',
          )),
          if(!isMe)BuildCustomTextButton(
            text: isFollowing ? 'Following' : 'follow',
            onPressed: () {setState(() {
              isFollowing = !isFollowing;
            });},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildIconButtonWithCircleAvatar(
                  icon: Icons.bookmark_border_sharp,
                  onTap: () {},
                  circleAvatarColor: Colors.white,
                  iconColor: primaryColor),
              BuildCustomIconButton(
                  icon: Icons.more_horiz,
                  onTap: () {
                    myBottomSheet(
                        context,
                        isMe
                            ? storyBottomSheetItemsMyView
                            : storyBottomSheetItemsOtherView);
                  },
                  color: Colors.black),
            ],
          )
        ],
      ),
    );
  }
}
